<#
.SYNOPSIS
  System Inventory & Performance Report (Dark HTML, Chart.js, Tabs, Responsive)
.DESCRIPTION
  Generates HTML report automatically on runtime (in %TEMP%).
  Export buttons (PDF, CSV, Excel) are placeholders, actual export run via
  Export-ToPDF / Export-ToCSV / Export-ToExcel functions in PowerShell session.
#>

Add-Type -AssemblyName System.Windows.Forms

# ---------- Output Path ----------
$saveDir  = $env:TEMP
$htmlPath = Join-Path $saveDir "system_report.html"

Write-Host "Generating system report in $saveDir..." -ForegroundColor Cyan

# ---------- Data Collection ----------
$ComputerSystem = Get-CimInstance Win32_ComputerSystem
$BIOS           = Get-CimInstance Win32_BIOS
$CPU            = Get-CimInstance Win32_Processor
$MemoryModules  = Get-CimInstance Win32_PhysicalMemory
$Disks          = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
$GPU            = Get-CimInstance Win32_VideoController
$OS             = Get-CimInstance Win32_OperatingSystem
$Motherboard    = Get-CimInstance Win32_BaseBoard
$NICs           = Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true }

$IPInfo = foreach ($nic in $NICs) {
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
$USBDevices   = Get-PnpDevice | Where-Object { $_.InstanceId -like "USB*" } |
    Select Class,FriendlyName,Manufacturer,Status,InstanceId
$Batteries    = Get-CimInstance Win32_Battery
$Keyboards    = Get-CimInstance Win32_Keyboard
$Pointing     = Get-CimInstance Win32_PointingDevice
$Monitors     = Get-CimInstance Win32_DesktopMonitor
$Services     = Get-Service | Select Name,DisplayName,Status,StartType

# ---------- Performance ----------
$cpuLoad  = (Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average
$totalMem = [math]::Round($OS.TotalVisibleMemorySize/1MB,2)
$freeMem  = [math]::Round($OS.FreePhysicalMemory/1MB,2)
$usedMem  = $totalMem - $freeMem
$memUtil  = [math]::Round(($usedMem/$totalMem)*100,2)
$totalDisk = ($Disks | Measure-Object -Property Size -Sum).Sum
$freeDisk  = ($Disks | Measure-Object -Property FreeSpace -Sum).Sum
$diskUsedPercent = if ($totalDisk -gt 0) { [math]::Round((($totalDisk - $freeDisk)/$totalDisk)*100,2) } else { 0 }
$uptime = (Get-Date) - $OS.LastBootUpTime

$cpuUsage = [PSCustomObject]@{ "CPU Usage (%)"=$cpuLoad }
$memUsage = [PSCustomObject]@{ "Total RAM (GB)"=$totalMem;"Used RAM (GB)"=$usedMem;"Free RAM (GB)"=$freeMem;"Utilization (%)"=$memUtil }

$diskPerf = foreach ($disk in Get-CimInstance Win32_DiskDrive) {
    $vols = ($disk | Get-CimAssociatedInstance -ResultClassName Win32_DiskPartition |
             Get-CimAssociatedInstance -ResultClassName Win32_LogicalDisk).DeviceID -join ", "
    [PSCustomObject]@{
        Model      = $disk.Model
        Interface  = $disk.InterfaceType
        SizeGB     = [math]::Round($disk.Size/1GB,2)
        Partitions = $disk.Partitions
        Status     = $disk.Status
        Volumes    = $vols
    }
}

# ---------- HTML Table Helper ----------
function ConvertTo-HTMLTable {
    param($Data,$Title)
    if (-not $Data) { return "" }
    $html = "<h3>$Title</h3><div class='table-container'><table>"
    if ($Data -is [System.Collections.IEnumerable] -and -not ($Data -is [string])) {
        $props = $Data | Select-Object -First 1 | Get-Member -MemberType Property,NoteProperty | Select -Expand Name
        $html += "<tr>" + ($props|%{"<th>$_</th>"}) -join "" + "</tr>"
        foreach ($row in $Data) {
            $cells = foreach ($p in $props) { 
                $v=$row.$p; if($null -eq $v -or "$v" -eq ""){"<td>-</td>"} else {"<td>$v</td>"} 
            }
            $html += "<tr>" + ($cells -join "") + "</tr>"
        }
    } else {
        $props = $Data | Get-Member -MemberType *Property|Select -Expand Name
        $html += "<tr><th>Property</th><th>Value</th></tr>"
        foreach ($p in $props) {
            $v=$Data.$p; if($null-ne $v -and "$v".Trim() -ne ""){
              if ($v -is [Array]){$v=$v -join ", "}
              $html += "<tr><td>$p</td><td>$v</td></tr>"
            }
        }
    }
    $html += "</table></div>"; return $html
}

# ---------- Build HTML ----------
$HTML = @"
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>System Report</title>
<style>
body {font-family:'Segoe UI',Tahoma;background:#1e1e1e;color:#e0e0e0;margin:20px;}
h1,h2,h3{color:#fff;}
.table-container{width:100%;overflow-x:auto;margin-bottom:20px;}
table{border-collapse:collapse;width:100%;background:#2c2c2c;color:#e0e0e0;}
th,td{border:1px solid #555;padding:6px 8px;text-align:center;}
th{background:#444;}
tr:nth-child(even){background:#2a2a2a;}
.tab{overflow:hidden;border-bottom:1px solid #444;background:#2c2c2c;}
.tab button{background:inherit;float:left;border:none;cursor:pointer;padding:10px 16px;color:#e0e0e0;}
.tab button.active{background:#666;}
.tabcontent{display:none;padding:20px 0;}
.dashboard{display:flex;flex-wrap:wrap;gap:15px;justify-content:center;}
.card{flex:1 1 250px;max-width:320px;background:#2c2c2c;padding:15px;border:1px solid #555;border-radius:6px;text-align:center;}
.card h2{margin:0 0 10px;}
.actions{float:right;margin-top:-70px;}
.actions a{background:#444;color:#fff;padding:8px 12px;margin-left:8px;border-radius:4px;text-decoration:none;}
.actions a:hover{background:#666;}
#backToTop{display:none;position:fixed;bottom:20px;right:20px;background:#444;color:#fff;
           padding:10px 14px;border:none;border-radius:6px;cursor:pointer;}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
function openTab(evt, name){var i,content,links;content=document.getElementsByClassName("tabcontent");
for(i=0;i<content.length;i++){content[i].style.display="none";}
links=document.getElementsByClassName("tablink");
for(i=0;i<links.length;i++){links[i].className=links[i].className.replace(" active","");}
document.getElementById(name).style.display="block";evt.currentTarget.className+=" active";}
window.onscroll=function(){var b=document.getElementById("backToTop");
if(document.documentElement.scrollTop>200){b.style.display="block";}else{b.style.display="none";}};
function topFunction(){window.scrollTo({top:0,behavior:'smooth'});}
window.onload=function(){document.getElementsByClassName('tablink')[0].click();
new Chart(document.getElementById('cpuSummary').getContext('2d'),{type:'doughnut',
data:{labels:['Used','Free'],datasets:[{data:[${cpuLoad},${100-$cpuLoad}],
backgroundColor:['#ff4d4d','#4dff88']}]},options:{plugins:{legend:{labels:{color:'#fff'},position:'bottom'}}}});
new Chart(document.getElementById('memSummary').getContext('2d'),{type:'doughnut',
data:{labels:['Used','Free'],datasets:[{data:[${memUtil},${100-$memUtil}],
backgroundColor:['#1e90ff','#aaaaaa']}]},options:{plugins:{legend:{labels:{color:'#fff'},position:'bottom'}}}});
new Chart(document.getElementById('diskSummary').getContext('2d'),{type:'doughnut',
data:{labels:['Used','Free'],datasets:[{data:[${diskUsedPercent},${100-$diskUsedPercent}],
backgroundColor:['#9b59b6','#27ae60']}]},options:{plugins:{legend:{labels:{color:'#fff'},position:'bottom'}}}});
}
</script>
</head>
<body>
<div style="display:flex;align-items:center;justify-content:space-between;">
  <div><img src="https://github.com/cmarko89/static-content/raw/main/logo-transparent.png" style="max-height:150px;"></div>
  <div class="actions">
    <a href="#">Export PDF</a>
    <a href="#">Export CSV</a>
    <a href="#">Export Excel</a>
  </div>
</div>
<h1>System Inventory & Performance Report</h1>
<p><b>Computer:</b> $env:COMPUTERNAME &nbsp;&nbsp;<b>Model:</b> $($ComputerSystem.Model) &nbsp;&nbsp;<b>User:</b> $env:USERNAME &nbsp;&nbsp;<b>Generated:</b> $(Get-Date)</p>

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
    <div class="card"><h2>CPU</h2><canvas id="cpuSummary"></canvas><p>${cpuLoad}% Utilization</p></div>
    <div class="card"><h2>Memory</h2><canvas id="memSummary"></canvas><p>${memUtil}% Utilization<br/>${usedMem} / ${totalMem} GB</p></div>
    <div class="card"><h2>Disk</h2><canvas id="diskSummary"></canvas><p>${diskUsedPercent}% Used</p></div>
    <div class="card"><h2>System</h2><p><b>OS:</b> $($OS.Caption) ($($OS.OSArchitecture))</p><p><b>Uptime:</b> $([string]::Format("{0:%d}d {0:%h}h {0:%m}m",$uptime))</p>
    <p><b>Printers:</b> $($Printers.Count) | <b>USB Devices:</b> $($USBDevices.Count)</p><p><b>Services:</b> $($Services.Count)</p></div>
  </div>
</div>

<div id="Overview" class="tabcontent">
$(ConvertTo-HTMLTable $ComputerSystem "Computer System")
$(ConvertTo-HTMLTable $BIOS "BIOS")
$(ConvertTo-HTMLTable $Motherboard "Motherboard")
$(ConvertTo-HTMLTable $CPU "CPU")
$(ConvertTo-HTMLTable $GPU "Graphics")
$(ConvertTo-HTMLTable $OS "Operating System")
$(ConvertTo-HTMLTable ($MemoryModules|Select Manufacturer,PartNumber,@{n="CapacityGB";e={[math]::Round($_.Capacity/1GB,2)}}) "Memory Modules")
</div>

<div id="Performance" class="tabcontent">
$(ConvertTo-HTMLTable $cpuUsage "CPU Usage")
$(ConvertTo-HTMLTable $memUsage "Memory Usage")
</div>

<div id="Disks" class="tabcontent">
$(ConvertTo-HTMLTable ($Disks|Select DeviceID,VolumeName,@{n="SizeGB";e={[math]::Round($_.Size/1GB,2)}},@{n="FreeGB";e={[math]::Round($_.FreeSpace/1GB,2)}}) "Logical Disks")
$(ConvertTo-HTMLTable $diskPerf "Physical Disk Info")
</div>

<div id="Network" class="tabcontent">$(ConvertTo-HTMLTable $IPInfo "Network Interfaces")</div>
<div id="Peripherals" class="tabcontent">
$(ConvertTo-HTMLTable $SoundDevices "Audio Devices")
$(ConvertTo-HTMLTable $Printers "Printers")
$(ConvertTo-HTMLTable $USBDevices "USB Devices")
$(ConvertTo-HTMLTable $Keyboards "Keyboards")
$(ConvertTo-HTMLTable $Pointing "Pointing Devices")
$(ConvertTo-HTMLTable $Monitors "Monitors")
$(ConvertTo-HTMLTable $Batteries "Batteries")
</div>
<div id="Services" class="tabcontent">$(ConvertTo-HTMLTable ($Services|Sort Status,Name) "Services Overview")</div>
<button onclick="topFunction()" id="backToTop">↑ Top</button>
<div class="footer">Report generated by Emkraan</div>
</body>
</html>
"@

# ---------- Save HTML & Open ----------
$HTML | Set-Content $htmlPath -Encoding UTF8
Start-Process $htmlPath
Write-Host "HTML report saved & opened: $htmlPath" -ForegroundColor Green

# ---------- Export Functions ----------
function Export-ToPDF {
    $dlg = New-Object System.Windows.Forms.SaveFileDialog
    $dlg.Filter = "PDF Files (*.pdf)|*.pdf"
    $dlg.FileName = "system_report.pdf"
    if($dlg.ShowDialog() -eq "OK"){
        $pdfPath=$dlg.FileName
        $edgePaths=@("$env:ProgramFiles (x86)\Microsoft\Edge\Application\msedge.exe",
                     "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe")
        $edge=$edgePaths|?{Test-Path $_}|Select -First 1
        if($edge){& $edge "--headless" "--disable-gpu" "--print-to-pdf=$pdfPath" $htmlPath
                  Write-Host "Exported PDF -> $pdfPath" -ForegroundColor Green}
        else{Write-Warning "Edge not found for PDF export."}
    }
}
function Export-ToCSV {
    $dlg=New-Object System.Windows.Forms.SaveFileDialog
    $dlg.Filter="CSV Files (*.csv)|*.csv"
    $dlg.FileName="system_report.csv"
    if($dlg.ShowDialog() -eq "OK"){
        $path=$dlg.FileName
        $ComputerSystem,$BIOS,$CPU,$GPU,$OS,$MemoryModules,$Disks,$diskPerf,$IPInfo,
        $SoundDevices,$Printers,$USBDevices,$Keyboards,$Pointing,$Monitors,$Batteries,$Services |
        Export-Csv $path -NoType -Encoding UTF8
        Write-Host "Exported CSV -> $path" -ForegroundColor Green
    }
}
function Export-ToExcel {
    $dlg=New-Object System.Windows.Forms.SaveFileDialog
    $dlg.Filter="Excel Files (*.xlsx)|*.xlsx"
    $dlg.FileName="system_report.xlsx"
    if($dlg.ShowDialog() -eq "OK"){
        $path=$dlg.FileName
        if(Get-Module -ListAvailable -Name ImportExcel){
            $params=@{Path=$path;AutoSize=$true;Show=$false}
            $ComputerSystem|Export-Excel @params -WorksheetName "System"
            $CPU|Export-Excel @params -WorksheetName "CPU" -Append
            $GPU|Export-Excel @params -WorksheetName "GPU" -Append
            $OS|Export-Excel @params -WorksheetName "OS" -Append
            $MemoryModules|Export-Excel @params -WorksheetName "Memory" -Append
            $Disks|Export-Excel @params -WorksheetName "LogicalDisks" -Append
            $diskPerf|Export-Excel @params -WorksheetName "PhysicalDisks" -Append
            $IPInfo|Export-Excel @params -WorksheetName "Network" -Append
            $SoundDevices|Export-Excel @params -WorksheetName "Sound" -Append
            $Printers|Export-Excel @params -WorksheetName "Printers" -Append
            $USBDevices|Export-Excel @params -WorksheetName "USB" -Append
            $Keyboards|Export-Excel @params -WorksheetName "Keyboards" -Append
            $Pointing|Export-Excel @params -WorksheetName "Pointing" -Append
            $Monitors|Export-Excel @params -WorksheetName "Monitors" -Append
            $Batteries|Export-Excel @params -WorksheetName "Battery" -Append
            $Services|Export-Excel @params -WorksheetName "Services" -Append
            Write-Host "Exported Excel -> $path" -ForegroundColor Green
        } else {
            Write-Warning "ImportExcel not found, please install: Install-Module ImportExcel"
        }
    }
}