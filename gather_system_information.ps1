<#
System Report Script
Emkraan branded
- Dark HTML dashboard with tabs & responsive tables
- Summary tab: CPU/Memory/Disk doughnut charts + system details (CPU+GPU, uptime, printers, services)
- Performance tab: sampled data (30s) CPU/Memory/Disk as line charts
- Printers trimmed to 5 useful columns
- Excel export: **disabled/commented out**
- Shows progress in console during performance sampling
#>

$tempDir  = $env:TEMP
$htmlPath = Join-Path $tempDir "system_report.html"

# ====================================================================
# Data Collection
# ====================================================================
Write-Host "Collecting system inventory..." -ForegroundColor Cyan

$ComputerSystem = Get-CimInstance Win32_ComputerSystem
$CPU            = Get-CimInstance Win32_Processor
$GPU            = Get-CimInstance Win32_VideoController
$MemoryModules  = Get-CimInstance Win32_PhysicalMemory
$Disks          = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
$OS             = Get-CimInstance Win32_OperatingSystem
$BIOS           = Get-CimInstance Win32_BIOS
$Motherboard    = Get-CimInstance Win32_BaseBoard
$NICs           = Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled }
$Printers       = Get-CimInstance Win32_Printer | Select Name,DriverName,PortName,Default,WorkOffline
$USBDevices     = Get-PnpDevice | Where-Object { $_.InstanceId -like "USB*" } |
                    Select Class,FriendlyName,Manufacturer,Status,InstanceId
$Services       = Get-Service | Select Name,DisplayName,Status,StartType

$IPInfo = foreach ($nic in $NICs) {
    [PSCustomObject]@{
        Description    = $nic.Description
        MACAddress     = $nic.MACAddress
        IPAddress      = $nic.IPAddress -join ", "
        DefaultGateway = $nic.DefaultIPGateway -join ", "
        DNSServers     = $nic.DNSServerSearchOrder -join ", "
    }
}

# Snapshot values
$cpuLoad   = [math]::Round((Get-CimInstance Win32_Processor | Measure -Property LoadPercentage -Average).Average,0)
$cpuFree   = 100 - $cpuLoad
$totalMem  = [math]::Round($OS.TotalVisibleMemorySize/1MB,2)
$freeMem   = [math]::Round($OS.FreePhysicalMemory/1MB,2)
$usedMem   = $totalMem - $freeMem
$memUtil   = if ($totalMem -gt 0) {[math]::Round(($usedMem/$totalMem)*100,0)} else {0}
$diskSum   = ($Disks | Measure -Property Size -Sum).Sum
$diskFree  = ($Disks | Measure -Property FreeSpace -Sum).Sum
$diskUsed  = $diskSum - $diskFree
$diskUsedGB= [math]::Round($diskUsed/1GB,2)
$diskFreeGB= [math]::Round($diskFree/1GB,2)
$diskUsedPct = if ($diskSum -gt 0) { [math]::Round(($diskUsed/$diskSum)*100,0) } else {0}
$uptime = (Get-Date) - $OS.LastBootUpTime
$gpuNames = if ($GPU) { ($GPU | Select -Expand Name) -join "<br/>" } else { "None" }

# ====================================================================
# Collect Performance Samples (30 seconds with progress bar)
# ====================================================================
$cpuSamples   = @()
$memSamples   = @()
$diskSamples  = @()

$totalSamples = 15   # 15 x 2s = 30 seconds
for ($i=1; $i -le $totalSamples; $i++) {
    Write-Progress -Activity "Collecting performance samples" `
                   -Status "Sample $i of $totalSamples..." `
                   -PercentComplete (($i / $totalSamples) * 100)

    $cpuNow  = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
    $memNow  = 100 - ((Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue / ($totalMem*1024)) * 100
    $diskNow = (Get-Counter '\PhysicalDisk(_Total)\% Disk Time').CounterSamples.CookedValue

    $cpuSamples  += [math]::Round($cpuNow,0)
    $memSamples  += [math]::Round($memNow,0)
    $diskSamples += [math]::Round($diskNow,0)

    Start-Sleep -Seconds 2
}

$cpuArr   = ($cpuSamples -join ",")
$memArr   = ($memSamples -join ",")
$diskArr  = ($diskSamples -join ",")
$labels   = (0..($cpuSamples.Count-1) | ForEach-Object {$_*2}) -join ","

# ====================================================================
# Helper: ConvertTo-HTMLTable
# ====================================================================
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

# ====================================================================
# HTML Report
# ====================================================================
$HTML = @"
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>System Report</title>
<style>
body {font-family:'Segoe UI',Tahoma;background:#1e1e1e;color:#ddd;margin:0;}
h1 {color:#4FC3F7;margin-top:0;}
h2,h3 {color:#81D4FA;}
.table-container{overflow-x:auto;margin-bottom:20px;max-width:100%;}
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
#backToTop{display:none;position:fixed;bottom:20px;right:20px;background:#E53935;color:#fff;
           padding:10px 14px;border:none;border-radius:6px;cursor:pointer;}
.valueHeader{color:#fff;}
.valueData{color:#4CAF50;font-weight:bold;}
.logo {margin-top:10px;margin-bottom:30px;text-align:left;}
.logo img{width:260px;height:auto;}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
function openTab(evt, name){
  var i,c=document.getElementsByClassName("tabcontent"),l=document.getElementsByClassName("tablink");
  for(i=0;i<c.length;i++){c[i].style.display="none";}
  for(i=0;i<l.length;i++){l[i].className=l[i].className.replace(" active","");}
  document.getElementById(name).style.display="block";evt.currentTarget.className+=" active";
}
window.onscroll=function(){var b=document.getElementById("backToTop");if(document.documentElement.scrollTop>200){b.style.display="block";}else{b.style.display="none";}};
function topFunction(){window.scrollTo({top:0,behavior:'smooth'});}
window.onload=function(){
  document.getElementsByClassName('tablink')[0].click();

  // Summary doughnuts
  new Chart(document.getElementById('cpuChartSummary').getContext('2d'),
    {type:'doughnut',data:{labels:['Used','Free'],datasets:[{data:[${cpuLoad},${cpuFree}],backgroundColor:['#E53935','#43A047']}]}});
  new Chart(document.getElementById('memChartSummary').getContext('2d'),
    {type:'doughnut',data:{labels:['Used','Free'],datasets:[{data:[${usedMem},${freeMem}],backgroundColor:['#1E88E5','#757575']}]}});
  new Chart(document.getElementById('diskChartSummary').getContext('2d'),
    {type:'doughnut',data:{labels:['Used','Free'],datasets:[{data:[${diskUsedGB},${diskFreeGB}],backgroundColor:['#8E24AA','#00897B']}]}});
  
  // Performance line charts
  new Chart(document.getElementById('cpuRealtime').getContext('2d'),
    {type:'line',data:{labels:[${labels}],datasets:[{label:'CPU %',data:[${cpuArr}],borderColor:'#E53935',fill:false}]},options:{scales:{y:{min:0,max:100}}}});
  new Chart(document.getElementById('memRealtime').getContext('2d'),
    {type:'line',data:{labels:[${labels}],datasets:[{label:'Memory %',data:[${memArr}],borderColor:'#1E88E5',fill:false}]},options:{scales:{y:{min:0,max:100}}}});
  new Chart(document.getElementById('diskRealtime').getContext('2d'),
    {type:'line',data:{labels:[${labels}],datasets:[{label:'Disk %',data:[${diskArr}],borderColor:'#8E24AA',fill:false}]},options:{scales:{y:{min:0,max:100}}}});
}
</script>
</head>
<body>
<div class="logo"><img src="https://github.com/cmarko89/static-content/raw/main/logo-transparent-slim.png"></div>
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
 <button class="tablink" onclick="openTab(event,'Printers')">Printers</button>
 <button class="tablink" onclick="openTab(event,'Services')">Services</button>
</div>

<div id="Summary" class="tabcontent">
 <div class="dashboard">
  <div class="card"><h2>CPU</h2><canvas id="cpuChartSummary"></canvas><p>${cpuLoad}% Utilization</p></div>
  <div class="card"><h2>Memory</h2><canvas id="memChartSummary"></canvas><p>${memUtil}% Utilization<br/>${usedMem} / ${totalMem} GB</p></div>
  <div class="card"><h2>Disk</h2><canvas id="diskChartSummary"></canvas><p>${diskUsedPct}% Used<br/>Total: $([math]::Round($diskSum/1GB,2)) GB</p></div>
  <div class="card"><h2>System</h2>
   <p><b>OS:</b> $($OS.Caption) ($($OS.OSArchitecture))</p>
   <p><b>CPU:</b> $($CPU.Name)</p>
   <p><b>GPU:</b> $gpuNames</p>
   <p><b>Uptime:</b> $([string]::Format("{0:%d}d {0:%h}h {0:%m}m",$uptime))</p>
   <p><b>Printers:</b> $($Printers.Count) | <b>USB Devices:</b> $($USBDevices.Count)</p>
   <p><b>Services:</b> $($Services.Count)</p>
  </div>
 </div>
</div>

<div id="Performance" class="tabcontent">
 <h3>CPU / Memory / Disk (last 30s samples)</h3>
 <canvas id="cpuRealtime" height="120"></canvas>
 <canvas id="memRealtime" height="120"></canvas>
 <canvas id="diskRealtime" height="120"></canvas>
</div>

<div id="Overview" class="tabcontent">
$(ConvertTo-HTMLTable $ComputerSystem "Computer System")
$(ConvertTo-HTMLTable $BIOS "BIOS")
$(ConvertTo-HTMLTable $Motherboard "Motherboard")
$(ConvertTo-HTMLTable $CPU "CPU")
$(ConvertTo-HTMLTable $GPU "Graphics")
$(ConvertTo-HTMLTable $OS "OS")
$(ConvertTo-HTMLTable ($MemoryModules|Select Manufacturer,PartNumber,@{n="CapacityGB";e={[math]::Round($_.Capacity/1GB,2)}}) "Memory Modules")
</div>

<div id="Disks" class="tabcontent">
$(ConvertTo-HTMLTable ($Disks|Select DeviceID,VolumeName,@{n="SizeGB";e={[math]::Round($_.Size/1GB,2)}},@{n="FreeGB";e={[math]::Round($_.FreeSpace/1GB,2)}}) "Logical Disks")
</div>

<div id="Network" class="tabcontent">$(ConvertTo-HTMLTable $IPInfo "Network Interfaces")</div>
<div id="Printers" class="tabcontent">$(ConvertTo-HTMLTable $Printers "Printers (Minimal)")</div>
<div id="Services" class="tabcontent">$(ConvertTo-HTMLTable ($Services|Sort Status,Name) "Services Overview")</div>

<button onclick="topFunction()" id="backToTop">TOP</button>
<div class="footer">Report generated by Emkraan</div>
</body>
</html>
"@

# ====================================================================
# Save & Launch
# ====================================================================
$HTML | Set-Content $htmlPath -Encoding UTF8
Start-Process $htmlPath

Write-Host "HTML report saved: $htmlPath" -ForegroundColor Green