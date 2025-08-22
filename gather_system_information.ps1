<#
System Report
Dark theme HTML system inventory with charts and Excel export.
Exports full inventory to Excel if ImportExcel available.
#>

# ---------- Paths ----------
$tempDir  = $env:TEMP
$htmlPath = Join-Path $tempDir "system_report.html"
$xlsxPath = Join-Path $tempDir "system_report.xlsx"

# ---------- Data ----------
$ComputerSystem = Get-CimInstance Win32_ComputerSystem
$BIOS           = Get-CimInstance Win32_BIOS
$CPU            = Get-CimInstance Win32_Processor
$MemoryModules  = Get-CimInstance Win32_PhysicalMemory
$Disks          = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
$GPU            = Get-CimInstance Win32_VideoController
$OS             = Get-CimInstance Win32_OperatingSystem
$Motherboard    = Get-CimInstance Win32_BaseBoard
$NICs           = Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled }

$IPInfo     = foreach ($nic in $NICs) {
    [PSCustomObject]@{
        Description    = $nic.Description
        MACAddress     = $nic.MACAddress
        IPAddress      = $nic.IPAddress -join ", "
        DefaultGateway = $nic.DefaultIPGateway -join ", "
        DNSServers     = $nic.DNSServerSearchOrder -join ", "
    }
}
$SoundDevices = Get-CimInstance Win32_SoundDevice
$Printers     = Get-CimInstance Win32_Printer
$USBDevices   = Get-PnpDevice | Where-Object { $_.InstanceId -like "USB*" } | Select Class,FriendlyName,Manufacturer,Status,InstanceId
$Batteries    = Get-CimInstance Win32_Battery
$Keyboards    = Get-CimInstance Win32_Keyboard
$Pointing     = Get-CimInstance Win32_PointingDevice
$Monitors     = Get-CimInstance Win32_DesktopMonitor
$Services     = Get-Service | Select Name,DisplayName,Status,StartType

# ---------- Performance ----------
$cpuLoad   = [math]::Round((Get-CimInstance Win32_Processor | Measure -Property LoadPercentage -Average).Average,0)
$cpuFree   = 100 - $cpuLoad

$totalMem  = [math]::Round($OS.TotalVisibleMemorySize/1MB,2)
$freeMem   = [math]::Round($OS.FreePhysicalMemory/1MB,2)
$usedMem   = $totalMem - $freeMem
$memUtil   = [math]::Round(($usedMem/$totalMem)*100,0)

$diskSum   = ($Disks | Measure -Property Size -Sum).Sum
$diskFree  = ($Disks | Measure -Property FreeSpace -Sum).Sum
$diskUsed  = $diskSum - $diskFree
$diskUsedGB= [math]::Round($diskUsed/1GB,2)
$diskFreeGB= [math]::Round($diskFree/1GB,2)
$diskUsedPct = if ($diskSum -gt 0) { [math]::Round(($diskUsed/$diskSum)*100,0) } else {0}

$uptime = (Get-Date) - $OS.LastBootUpTime

$gpuNames = if ($GPU) { ($GPU | Select -Expand Name) -join "<br/>" } else { "" }

# ---------- Table Builder ----------
function ConvertTo-HTMLTable {
    param($Data,$Title)
    if (-not $Data) { return "" }
    $html = "<h3>$Title</h3><div class='table-container'><table>"
    if ($Data -is [System.Collections.IEnumerable] -and -not ($Data -is [string])) {
        $props = $Data | Select -First 1 | Get-Member -MemberType Property,NoteProperty | Select -Expand Name
        $html += "<tr>" + ($props|%{"<th>$_</th>"}) -join "" + "</tr>"
        foreach ($row in $Data) {
            $cells = foreach ($p in $props) {
                $v=$row.$p; if([string]::IsNullOrWhiteSpace($v)){"<td>-</td>"} else {"<td>$v</td>"}
            }
            $html += "<tr>" + ($cells -join "") + "</tr>"
        }
    }
    else {
        $props = $Data | Get-Member -MemberType *Property | Select -Expand Name
        $html += "<tr><th>Property</th><th>Value</th></tr>"
        foreach ($p in $props) {
            $v=$Data.$p; if(-not [string]::IsNullOrWhiteSpace("$v")){
                if ($v -is [Array]){$v=$v -join ", "}
                $html += "<tr><td>$p</td><td>$v</td></tr>"
            }
        }
    }
    $html += "</table></div>";return $html
}

# ---------- HTML ----------
$HTML = @"
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>System Report</title>
<style>
body {font-family:'Segoe UI',Tahoma;background:#1e1e1e;color:#ddd;margin:0;}
h1 {color:#4FC3F7;}
h2,h3 {color:#81D4FA;}
.table-container{overflow-x:auto;margin-bottom:20px;}
table{border-collapse:collapse;width:100%;background:#2c2c2c;color:#eee;}
th,td{border:1px solid #555;padding:6px 8px;text-align:center;}
th{background:#37474F;color:#4FC3F7;}
tr:nth-child(even){background:#263238;}
.tab{overflow:hidden;border-bottom:1px solid #444;background:#2c2c2c;margin-top:20px;}
.tab button{background:inherit;border:none;padding:10px 16px;color:#e0e0e0;cursor:pointer;}
.tab button.active{background:#546E7A;}
.tabcontent{display:none;padding:20px 0;}
.dashboard{display:flex;flex-wrap:wrap;gap:15px;justify-content:center;}
.card{flex:1 1 250px;max-width:320px;background:#2c2c2c;padding:15px;border:1px solid #555;border-radius:6px;text-align:center;}
.card h2{margin:0 0 10px;color:#4FC3F7;}
.actions{float:right;margin-top:-70px;}
.actions a{background:#4FC3F7;color:#000;padding:8px 12px;margin-left:8px;border-radius:4px;text-decoration:none;font-weight:bold;}
#backToTop{display:none;position:fixed;bottom:20px;right:20px;background:#E53935;color:#fff;
           padding:10px 14px;border:none;border-radius:6px;cursor:pointer;}
.valueHeader{color:#fff;}
.valueData{color:#4CAF50;font-weight:bold;}
.logo {margin-top:10px;margin-bottom:30px;text-align:left;}
.logo img{width:300px;height:auto;}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
function openTab(evt, name){
  var i,c=document.getElementsByClassName("tabcontent"),l=document.getElementsByClassName("tablink");
  for(i=0;i<c.length;i++){c[i].style.display="none";}
  for(i=0;i<l.length;i++){l[i].className=l[i].className.replace(" active","");}
  document.getElementById(name).style.display="block";evt.currentTarget.className+=" active";
}
window.onscroll=function(){
  var b=document.getElementById("backToTop");
  if(document.documentElement.scrollTop>200){b.style.display="block";}else{b.style.display="none";}
};
function topFunction(){window.scrollTo({top:0,behavior:'smooth'});}
window.onload=function(){
  document.getElementsByClassName('tablink')[0].click();
  new Chart(document.getElementById('cpuChart').getContext('2d'),{
    type:'doughnut',
    data:{labels:['Used %','Free %'],
          datasets:[{data:[${cpuLoad},${cpuFree}],
                     backgroundColor:['#E53935','#43A047']}]},
    options:{plugins:{legend:{labels:{color:'#fff'},position:'bottom'}}}});
  new Chart(document.getElementById('memChart').getContext('2d'),{
    type:'doughnut',
    data:{labels:['Used GB','Free GB'],
          datasets:[{data:[${usedMem},${freeMem}],
                     backgroundColor:['#1E88E5','#757575']}]},
    options:{plugins:{legend:{labels:{color:'#fff'},position:'bottom'}}}});
  new Chart(document.getElementById('diskChart').getContext('2d'),{
    type:'doughnut',
    data:{labels:['Used GB','Free GB'],
          datasets:[{data:[${diskUsedGB},${diskFreeGB}],
                     backgroundColor:['#8E24AA','#00897B']}]},
    options:{plugins:{legend:{labels:{color:'#fff'},position:'bottom'}}}});
}
</script>
</head>
<body>
<div class="logo">
  <img src="https://github.com/cmarko89/static-content/raw/main/logo-transparent.png">
</div>
<h1>System Inventory & Performance Report</h1>
<p><span class="valueHeader">Computer:</span> <span class="valueData">$env:COMPUTERNAME</span> &nbsp;&nbsp;
   <span class="valueHeader">Model:</span> <span class="valueData">$($ComputerSystem.Model)</span> &nbsp;&nbsp;
   <span class="valueHeader">User:</span> <span class="valueData">$env:USERNAME</span> &nbsp;&nbsp;
   <span class="valueHeader">Generated:</span> <span class="valueData">$(Get-Date)</span></p>

<div class="tab">
  <button class="tablink" onclick="openTab(event,'Summary')">Summary</button>
  <button class="tablink" onclick="openTab(event,'Overview')">Overview</button>
  <button class="tablink" onclick="openTab(event,'Performance')">Performance</button>
  <button class="tablink" onclick="openTab(event,'Disks')">Disks</button>
  <button class="tablink" onclick="openTab(event,'Network')">Network</button>
  <button class="tablink" onclick="openTab(event,'Peripherals')">Peripherals</button>
  <button class="tablink" onclick="openTab(event,'Services')">Services</button>
</div>

<div id="Summary" class="tabcontent">
  <div class="dashboard">
    <div class="card"><h2>CPU</h2><canvas id="cpuChart"></canvas><p>${cpuLoad}% Utilization<br/>$($CPU.Name)</p></div>
    <div class="card"><h2>Memory</h2><canvas id="memChart"></canvas><p>${memUtil}% Utilization<br/>${usedMem} / ${totalMem} GB</p></div>
    <div class="card"><h2>Disk</h2><canvas id="diskChart"></canvas><p>${diskUsedPct}% Used<br/>Total: $([math]::Round($diskSum/1GB,2)) GB</p></div>
    $(
      if ($GPU) {
        "<div class='card'><h2>Graphics</h2><p>$gpuNames</p></div>"
      }
    )
    <div class="card"><h2>System</h2><p><b>OS:</b> $($OS.Caption) ($($OS.OSArchitecture))</p>
    <p><b>Uptime:</b> $([string]::Format("{0:%d}d {0:%h}h {0:%m}m",$uptime))</p>
    <p><b>Printers:</b> $($Printers.Count) | <b>USB Devices:</b> $($USBDevices.Count)</p>
    <p><b>Services:</b> $($Services.Count)</p></div>
  </div>
</div>

<!-- other tabs here (unchanged) -->
<button onclick="topFunction()" id="backToTop">TOP</button>
<div class="footer">Report generated by Emkraan</div>
</body>
</html>
"@

# ----- Save HTML -----
$HTML | Set-Content $htmlPath -Encoding UTF8

# ----- Excel Export -----
if (Get-Module -ListAvailable -Name ImportExcel) {
    $params=@{Path=$xlsxPath;AutoSize=$true;Show=$false}
    $ComputerSystem|Export-Excel @params -WorksheetName "System"
    $CPU|Export-Excel @params -WorksheetName "CPU" -Append
    $GPU|Export-Excel @params -WorksheetName "GPU" -Append
    $OS|Export-Excel @params -WorksheetName "OS" -Append
    $MemoryModules|Export-Excel @params -WorksheetName "Memory" -Append
    $Disks|Export-Excel @params -WorksheetName "LogicalDisks" -Append
    $IPInfo|Export-Excel @params -WorksheetName "Network" -Append
    $SoundDevices|Export-Excel @params -WorksheetName "Sound" -Append
    $Printers|Export-Excel @params -WorksheetName "Printers" -Append
    $USBDevices|Export-Excel @params -WorksheetName "USB" -Append
    $Keyboards|Export-Excel @params -WorksheetName "Keyboards" -Append
    $Pointing|Export-Excel @params -WorksheetName "Pointing" -Append
    $Monitors|Export-Excel @params -WorksheetName "Monitors" -Append
    $Batteries|Export-Excel @params -WorksheetName "Battery" -Append
    $Services|Export-Excel @params -WorksheetName "Services" -Append
}

# ----- Launch -----
Start-Process $htmlPath
Write-Host "HTML saved: $htmlPath" -ForegroundColor Green
if (Test-Path $xlsxPath) {
    Write-Host "Excel saved: $xlsxPath" -ForegroundColor Green
} else {
    Write-Host "Excel not generated (ImportExcel module missing)" -ForegroundColor Yellow
}