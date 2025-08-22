<#
.SYNOPSIS
  Full Inventory & Performance Report with Dark Mode, Tabs, Responsive Design, Charts, Logo Branding, PDF Export
.DESCRIPTION
  Generates a detailed system report in a modern HTML dashboard (dark mode with tabs and responsive layout).
  Includes summary dashboard, performance charts, floating "Back to Top" button, and branding logo.
  Exports to HTML and also prints to PDF via Edge headless mode.
#>

# Prompt save location
$savePath = Read-Host "Enter full path and filename (e.g. C:\Users\Public\SystemReport.html)"
if (-not $savePath.ToLower().EndsWith(".html")) { $savePath += ".html" }
$pdfPath = [System.IO.Path]::ChangeExtension($savePath, ".pdf")

Write-Host "`nCollecting system inventory and metrics...`n"

# -------- Data Collection --------
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

# Peripherals
$SoundDevices  = Get-CimInstance Win32_SoundDevice
$Printers      = Get-CimInstance Win32_Printer
$USBDevices    = Get-PnpDevice | Where-Object { $_.InstanceId -like "USB*" } |
    Select-Object Class, FriendlyName, Manufacturer, Status, InstanceId
$Batteries     = Get-CimInstance Win32_Battery
$Keyboards     = Get-CimInstance Win32_Keyboard
$Pointing      = Get-CimInstance Win32_PointingDevice
$Monitors      = Get-CimInstance Win32_DesktopMonitor
$Services      = Get-Service | Select-Object Name, DisplayName, Status, StartType

# Performance snapshot
$cpuLoad = (Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average
$totalMem = [math]::Round($OS.TotalVisibleMemorySize/1MB,2)
$freeMem  = [math]::Round($OS.FreePhysicalMemory/1MB,2)
$usedMem  = $totalMem - $freeMem
$memUtil  = [math]::Round(($usedMem/$totalMem)*100,2)

# Disk overall usage summary
$totalDisk = ($Disks | Measure-Object -Property Size -Sum).Sum
$freeDisk  = ($Disks | Measure-Object -Property FreeSpace -Sum).Sum
$diskUsedPercent = if ($totalDisk -gt 0) { [math]::Round((($totalDisk - $freeDisk)/$totalDisk)*100,2) } else { 0 }

$cpuUsage = [PSCustomObject]@{ "CPU Usage (%)" = $cpuLoad }
$memUsage = [PSCustomObject]@{
    "Total RAM (GB)" = $totalMem
    "Used RAM (GB)"  = $usedMem
    "Free RAM (GB)"  = $freeMem
    "Utilization (%)"= $memUtil
}
$diskPerf = foreach ($disk in Get-CimInstance Win32_DiskDrive) {
    $vols = ($disk | Get-CimAssociatedInstance -ResultClassName Win32_DiskPartition |
             Get-CimAssociatedInstance -ResultClassName Win32_LogicalDisk).DeviceID -join ", "
    [PSCustomObject]@{
        Model        = $disk.Model
        Interface    = $disk.InterfaceType
        SizeGB       = [math]::Round($disk.Size/1GB,2)
        Partitions   = $disk.Partitions
        Status       = $disk.Status
        Volumes      = $vols
    }
}
# Uptime
$uptime = (Get-Date) - $OS.LastBootUpTime

# -------- HTML Table Helper --------
function ConvertTo-HTMLTable {
    param($Data, $Title)
    if (-not $Data) { return "" }
    $html = "<h3>$Title</h3><div class='table-container'><table>"
    if ($Data -is [System.Collections.IEnumerable] -and -not ($Data -is [string])) {
        $props = $Data | Select-Object -First 1 | Get-Member -MemberType Property,NoteProperty | Select-Object -ExpandProperty Name
        $html += "<tr>" + ($props | ForEach-Object { "<th>$_</th>" }) -join "" + "</tr>"
        foreach ($row in $Data) {
            $html += "<tr>" + ($props | ForEach-Object { "<td>$($row.$_)</td>" }) -join "" + "</tr>"
        }
    } else {
        $props = $Data | Get-Member -MemberType *Property | Select-Object -ExpandProperty Name
        $html += "<tr><th>Property</th><th>Value</th></tr>"
        foreach ($p in $props) {
            $val = $Data.$p; if ($val -is [System.Array]) { $val = $val -join ", " }
            $html += "<tr><td>$p</td><td>$val</td></tr>"
        }
    }
    $html += "</table></div>"; return $html
}

# -------- Build HTML --------
$HTML = @"
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>System Report</title>
<style>
body { font-family:'Segoe UI', Tahoma; margin:20px; background:#1e1e1e; color:#e0e0e0; }
h1,h2,h3 { color:#fff; }
.table-container { width:100%; overflow-x:auto; margin-bottom:20px; }
table { border-collapse:collapse; width:100%; background:#2c2c2c; color:#e0e0e0; }
th,td { border:1px solid #555; padding:6px 8px; font-size:0.9em; }
th { background:#444; color:#fff; }
tr:nth-child(even){ background:#2a2a2a; }
.tab { overflow:hidden; border-bottom:1px solid #444; background:#2c2c2c; }
.tab button { background:inherit; float:left; border:none; outline:none; cursor:pointer; padding:10px 16px;
              transition:0.3s; font-size:1em; color:#e0e0e0; }
.tab button:hover { background:#444; }
.tab button.active { background:#666; font-weight:bold; }
.tabcontent { display:none; padding:20px 0; }
.footer{margin-top:30px;font-size:0.85em;color:#aaa;}
.dashboard { display:flex; flex-wrap:wrap; justify-content:center; gap:15px; margin-top:20px; }
.card { flex:1 1 250px; max-width:320px; background:#2c2c2c; padding:15px; border:1px solid #555;
        border-radius:6px; text-align:center; color:#e0e0e0; }
.card h2 { margin:0 0 10px; color:#fff; }
/* Back-to-Top Button */
#backToTop {
  display:none; position:fixed; bottom:20px; right:20px; z-index:99;
  font-size:14px; border:none; outline:none; background-color:#444; color:#fff;
  cursor:pointer; padding:10px 14px; border-radius:6px; opacity:0.7;
}
#backToTop:hover { opacity:1; }
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
function openTab(evt, tabName) {
  var i, tabcontent, tablinks;
  tabcontent=document.getElementsByClassName("tabcontent");
  for(i=0;i<tabcontent.length;i++){ tabcontent[i].style.display="none"; }
  tablinks=document.getElementsByClassName("tablink");
  for(i=0;i<tablinks.length;i++){ tablinks[i].className=tablinks[i].className.replace(" active",""); }
  document.getElementById(tabName).style.display="block";
  evt.currentTarget.className += " active";
}
window.onscroll = function(){scrollFunction()};
function scrollFunction() {
  var btn=document.getElementById("backToTop");
  if(document.body.scrollTop > 200 || document.documentElement.scrollTop > 200){ btn.style.display="block"; }
  else{ btn.style.display="none"; }
}
function topFunction() { window.scrollTo({top:0, behavior:'smooth'}); }
window.onload=function(){
  document.getElementsByClassName('tablink')[0].click();
  // Charts
  new Chart(document.getElementById('cpuSummary').getContext('2d'),{
    type:'doughnut',
    data:{ labels:['Used','Free'], datasets:[{ data:[${cpuLoad}, ${100 - $cpuLoad}], backgroundColor:['#e74c3c','#2ecc71']}]},
    options:{ plugins:{legend:{labels:{color:'#fff'},position:'bottom'}} }
  });
  new Chart(document.getElementById('memSummary').getContext('2d'),{
    type:'doughnut',
    data:{ labels:['Used','Free'], datasets:[{ data:[${memUtil}, ${100 - $memUtil}], backgroundColor:['#3498db','#95a5a6']}]},
    options:{ plugins:{legend:{labels:{color:'#fff'},position:'bottom'}} }
  });
  new Chart(document.getElementById('diskSummary').getContext('2d'),{
    type:'doughnut',
    data:{ labels:['Used','Free'], datasets:[{ data:[${diskUsedPercent}, ${100 - $diskUsedPercent}], backgroundColor:['#9b59b6','#1abc9c']}]},
    options:{ plugins:{legend:{labels:{color:'#fff'},position:'bottom'}} }
  });
}
</script>
</head>
<body>
<img src="https://github.com/cmarko89/static-content/raw/main/logo-transparent.png" alt="Logo" style="max-height:80px; margin-bottom:15px;">
<h1>System Inventory & Performance Report</h1>
<p><b>Computer:</b> $env:COMPUTERNAME &nbsp;&nbsp; <b>User:</b> $env:USERNAME &nbsp;&nbsp; <b>Generated:</b> $(Get-Date)</p>

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
    <div class="card">
        <h2>CPU</h2>
        <canvas id="cpuSummary" width="150" height="150"></canvas>
        <p>${cpuLoad}% Utilization</p>
    </div>
    <div class="card">
        <h2>Memory</h2>
        <canvas id="memSummary" width="150" height="150"></canvas>
        <p>${memUtil}% Utilization<br/>${usedMem} GB / ${totalMem} GB</p>
    </div>
    <div class="card">
        <h2>Disk</h2>
        <canvas id="diskSummary" width="150" height="150"></canvas>
        <p>${diskUsedPercent}% Used</p>
    </div>
    <div class="card">
        <h2>System</h2>
        <p><b>OS:</b> $($OS.Caption) ($($OS.OSArchitecture))</p>
        <p><b>Uptime:</b> $([string]::Format("{0:%d}d {0:%h}h {0:%m}m",$uptime))</p>
        <p><b>Printers:</b> $($Printers.Count) | <b>USB Devices:</b> $($USBDevices.Count)</p>
        <p><b>Services:</b> $($Services.Count)</p>
    </div>
  </div>
</div>

<div id="Overview" class="tabcontent">
$(ConvertTo-HTMLTable $ComputerSystem "Computer System")
$(ConvertTo-HTMLTable $BIOS "BIOS")
$(ConvertTo-HTMLTable $Motherboard "Motherboard")
$(ConvertTo-HTMLTable $CPU "CPU")
$(ConvertTo-HTMLTable $GPU "Graphics")
$(ConvertTo-HTMLTable $OS "OS")
$(ConvertTo-HTMLTable ($MemoryModules | Select-Object Manufacturer,PartNumber,@{n="CapacityGB";e={[math]::Round($_.Capacity/1GB,2)}}) "Memory Modules")
</div>

<div id="Performance" class="tabcontent">
$(ConvertTo-HTMLTable $cpuUsage "CPU Usage")
$(ConvertTo-HTMLTable $memUsage "Memory Usage")
</div>

<div id="Disks" class="tabcontent">
$(ConvertTo-HTMLTable ($Disks | Select-Object DeviceID,VolumeName,@{n="SizeGB";e={[math]::Round($_.Size/1GB,2)}},@{n="FreeGB";e={[math]::Round($_.FreeSpace/1GB,2)}}) "Logical Disks")
$(ConvertTo-HTMLTable $diskPerf "Physical Disk Info")
</div>

<div id="Network" class="tabcontent">
$(ConvertTo-HTMLTable $IPInfo "Network Interfaces")
</div>

<div id="Peripherals" class="tabcontent">
$(ConvertTo-HTMLTable $SoundDevices "Audio Devices")
$(ConvertTo-HTMLTable $Printers "Printers")
$(ConvertTo-HTMLTable $USBDevices "USB Devices")
$(ConvertTo-HTMLTable $Keyboards "Keyboards")
$(ConvertTo-HTMLTable $Pointing "Pointing Devices")
$(ConvertTo-HTMLTable $Monitors "Monitors")
$(ConvertTo-HTMLTable $Batteries "Batteries")
</div>

<div id="Services" class="tabcontent">
$(ConvertTo-HTMLTable ($Services | Sort Status,Name) "Services Overview")
</div>

<button onclick="topFunction()" id="backToTop" title="Go to top">↑ Top</button>
<div class="footer">Report generated by PowerShell</div>
</body>
</html>
"@

# -------- Save HTML --------
$HTML | Set-Content -Path $savePath -Encoding UTF8
Write-Host "HTML Report saved: $savePath" -ForegroundColor Green

# -------- Export PDF with Edge headless --------
$edgePaths = @(
    "$env:ProgramFiles (x86)\Microsoft\Edge\Application\msedge.exe",
    "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe"
)
$edge = $edgePaths | Where-Object { Test-Path $_ } | Select-Object -First 1
if ($edge) {
    try {
        & $edge "--headless" "--disable-gpu" "--print-to-pdf=$pdfPath" $savePath
        if (Test-Path $pdfPath) {
            Write-Host "PDF Report exported: $pdfPath" -ForegroundColor Green
        }
    } catch { Write-Warning "Edge headless PDF export failed." }
} else {
    Write-Warning "Edge not found — skipping PDF export."
}

# -------- Open HTML in browser --------
Start-Process $savePath