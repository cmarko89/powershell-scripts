
$ErrorActionPreference = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAGwAZQBuAHQAbAB5AEMAbwBuAHQAaQBuAHUAZQA=')))
${b3883197eaa7469b886beaa378092673}  = $env:TEMP
${a24b2a9da61e4006ab88ce9dc5ee00f7} = Join-Path ${b3883197eaa7469b886beaa378092673} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwB5AHMAdABlAG0AXwByAGUAcABvAHIAdAAuAGgAdABtAGwA')))
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAGwAbABlAGMAdABpAG4AZwAgAHMAeQBzAHQAZQBtACAAaQBuAHYAZQBuAHQAbwByAHkALgAuAC4A'))) -ForegroundColor Cyan
${e83c2afc2fd94f328e12a80077189f70} = Get-CimInstance Win32_ComputerSystem
${302dc8f6ba1644b4806af920d5b01841}            = Get-CimInstance Win32_Processor
${fdfee5cfdb084b4aac0f32739d79571a}            = Get-CimInstance Win32_VideoController
${717b04a8629a4b408456ad2ec6453020}  = Get-CimInstance Win32_PhysicalMemory
${8b2694cb577e4b9a91302dd70590d5cc}          = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
${8bbbcc0ebf1e4bf78d8010823fa7df05}     = Get-CimInstance Win32_DiskDrive
${ca09ec8e54f441cbb897d3e7d3186667}             = Get-CimInstance Win32_OperatingSystem
${9d522c68a48b417bb8250e9ecc036753}    = Get-CimInstance Win32_BaseBoard
${c33a1303a8b04b8fad5a1f6a057cb8a0}           = Get-CimInstance Win32_NetworkAdapterConfiguration | ? { $_.IPEnabled }
${251a4370d4f6424aa37fbfa200b7441a}       = Get-CimInstance Win32_Printer | Select Name,DriverName,PortName,Default,WorkOffline
${c5f5eb90904e4d89967fdbb73377a61e}     = Get-PnpDevice | ? { $_.InstanceId -like $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBTAEIAKgA='))) } | Select Class,FriendlyName,Manufacturer,Status,InstanceId
${60b86701419f4686b0041aff4952dfe9}       = gsv | Select Name,DisplayName,Status,StartType
${6132aa9d2e8f4f0cbc9bb2bdafc98f51} = foreach (${6d825b612c3341f3bcc0537368fa128b} in ${c33a1303a8b04b8fad5a1f6a057cb8a0}) {
    [PSCustomObject]@{
        Description    = ${6d825b612c3341f3bcc0537368fa128b}.Description
        MACAddress     = ${6d825b612c3341f3bcc0537368fa128b}.MACAddress
        IPAddress      = ${6d825b612c3341f3bcc0537368fa128b}.IPAddress -join ", "
        DefaultGateway = ${6d825b612c3341f3bcc0537368fa128b}.DefaultIPGateway -join ", "
        DNSServers     = ${6d825b612c3341f3bcc0537368fa128b}.DNSServerSearchOrder -join ", "
    }
}
${52080a1ce5c447e6bb748a672dbe13ee}   = [math]::Round((Get-CimInstance Win32_Processor | Measure -Property LoadPercentage -Average).Average,0)
${8ebe94956ebc4aaa8ece23344e648546}   = 100 - ${52080a1ce5c447e6bb748a672dbe13ee}
${3f2aa4209431414d81228a504a383266}  = [math]::Round(${ca09ec8e54f441cbb897d3e7d3186667}.TotalVisibleMemorySize/1MB,2)
${7ce95356524b431a930ddf6d1e0fe942}   = [math]::Round(${ca09ec8e54f441cbb897d3e7d3186667}.FreePhysicalMemory/1MB,2)
${45d160df8bff4b9b9f6f2b4b9aedd2fe}   = ${3f2aa4209431414d81228a504a383266} - ${7ce95356524b431a930ddf6d1e0fe942}
${8bf2dc401b1445628ea7ef918092c8f7}   = if (${3f2aa4209431414d81228a504a383266} -gt 0) {[math]::Round((${45d160df8bff4b9b9f6f2b4b9aedd2fe}/${3f2aa4209431414d81228a504a383266})*100,0)} else {0}
${4350fa93db68444795027de91f0c1413}   = (${8b2694cb577e4b9a91302dd70590d5cc} | Measure -Property Size -Sum).Sum
${1d8a4ed0dae043279b25f2018d0627f4}  = (${8b2694cb577e4b9a91302dd70590d5cc} | Measure -Property FreeSpace -Sum).Sum
${c8f13ea305d042d6b5726f80de795cbf}  = ${4350fa93db68444795027de91f0c1413} - ${1d8a4ed0dae043279b25f2018d0627f4}
${2d6d030ad2614feb93c92b4b03c69ee0}= [math]::Round(${c8f13ea305d042d6b5726f80de795cbf}/1GB,2)
${17f4eaa5be8a411b809955385d7a79dd}= [math]::Round(${1d8a4ed0dae043279b25f2018d0627f4}/1GB,2)
${e22221c4f2b64ffaa973de1b9eb79f50} = if (${4350fa93db68444795027de91f0c1413} -gt 0) { [math]::Round((${c8f13ea305d042d6b5726f80de795cbf}/${4350fa93db68444795027de91f0c1413})*100,0) } else {0}
${6c0432df93b34227a5bfea60e8123af8} = (Get-Date) - ${ca09ec8e54f441cbb897d3e7d3186667}.LastBootUpTime
${d4b2396c01bf40249289161545b44807} = if (${302dc8f6ba1644b4806af920d5b01841}.MaxClockSpeed) { "$(${302dc8f6ba1644b4806af920d5b01841}.MaxClockSpeed) MHz" } else { $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgAvAEEA'))) }
${1ed8468541c94aeaa7bb1db51da63883} = if (${fdfee5cfdb084b4aac0f32739d79571a}) {
    ${fdfee5cfdb084b4aac0f32739d79571a} | % {
        ${a5a9cf9e94a34bdd9af15fb22ab516a1} = if ($_.AdapterRAM) { [math]::Round($_.AdapterRAM/1GB,2) } else { $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgAvAEEA'))) }
        "$($_.Name) (${a5a9cf9e94a34bdd9af15fb22ab516a1} GB)"
    } -join $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('PABiAHIALwA+AA==')))
} else { $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvAG4AZQA='))) }
${8729d131072a4e48b31c59064e13d090} = @{
    20=$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABEAFIA')));21=$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABEAFIAMgA=')));22=$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABEAFIAMgAgAEYAQgAtAEQASQBNAE0A')));24=$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABEAFIAMwA=')));26=$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABEAFIANAA=')));30=$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TABQAEQARABSADQA')));34=$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABEAFIANQA=')))
}
${91f17fc70bde40429c69bf4546876645} = ${717b04a8629a4b408456ad2ec6453020} | % {
    ${5c707f83a7fd42dfaad5a94615e8d000} = if (${8729d131072a4e48b31c59064e13d090}.ContainsKey($_.MemoryType)) { ${8729d131072a4e48b31c59064e13d090}[$_.MemoryType] } else { $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBuAGsAbgBvAHcAbgA='))) }
    ${e977aeed38c84856b00d5f660e89515c} = switch (${5c707f83a7fd42dfaad5a94615e8d000}) {
        $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABEAFIAMwA='))) { $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZABkAHIAMwA='))) }
        $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABEAFIANAA='))) { $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZABkAHIANAA='))) }
        $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABEAFIANQA='))) { $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ZABkAHIANQA='))) }
        default { $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('dQBuAGsAbgBvAHcAbgA='))) }
    }
    "<span class='${e977aeed38c84856b00d5f660e89515c}'>${5c707f83a7fd42dfaad5a94615e8d000} $($_.Speed) MHz</span>"
}
${79c8cee1eee74fae912f7485a80f1b1e} = (${91f17fc70bde40429c69bf4546876645} -join ", ")
${7f7e5eb004dc4210ac90658abdc7b4f6} = "$(${9d522c68a48b417bb8250e9ecc036753}.Manufacturer) $(${9d522c68a48b417bb8250e9ecc036753}.Product)"
${eaf42be71b4f4855b74b872c2d8c2a02} = @{}
try {
    ${de94979b8c4942508d004978fadbee4e} = gwmi -Namespace root\wmi -Class MSStorageDriver_FailurePredictStatus -ErrorAction SilentlyContinue
    foreach (${5d9dc8db1bf0428697befafb768af6a2} in ${de94979b8c4942508d004978fadbee4e}) {
        ${eaf42be71b4f4855b74b872c2d8c2a02}[${5d9dc8db1bf0428697befafb768af6a2}.InstanceName] = if (${5d9dc8db1bf0428697befafb768af6a2}.PredictFailure) { $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TCcgAFAAcgBlAGQAaQBjAHQAZQBkACAARgBhAGkAbAB1AHIAZQA='))) } else { $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('BScgAE8ASwA='))) }
    }
} catch { }
${efbeb80be4584434869893090a1806fc} = ${8bbbcc0ebf1e4bf78d8010823fa7df05} | % {
    [PSCustomObject]@{
        Model        = $_.Model
        Interface    = $_.InterfaceType
        SizeGB       = [math]::Round($_.Size/1GB,2)
        Status       = $_.Status
        SerialNumber = $_.SerialNumber
        Firmware     = $_.FirmwareRevision
        SMARTHealth  = (( ${eaf42be71b4f4855b74b872c2d8c2a02}.Keys |
            ? { $_ -like "*$($_.PNPDeviceID)*" } |
            % { ${eaf42be71b4f4855b74b872c2d8c2a02}[$_] }
        ) -join ",")
    }
}
${d574959ab60049268b52c0357456fe23} = (${8bbbcc0ebf1e4bf78d8010823fa7df05} | % { "$($_.Model) ($($_.InterfaceType))" }) -join $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('PABiAHIALwA+AA==')))
${cedd44f66fd340ed943263a712c61a7b}=@();${1335de6364f1443fa77678ed1aedf8b9}=@();${c649edc6c71342d9b11592d2127f7ca5}=@();${6f92d22e5b3148cea0aaf65d67793990}=@()
${1a44679c16c643d0974bd8460542fe68}=15
${2af65d050d59479cb4f4899155b8eaf7} = (Get-Counter $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('XABOAGUAdAB3AG8AcgBrACAASQBuAHQAZQByAGYAYQBjAGUAKAAqACkAXABCAHkAdABlAHMAIABUAG8AdABhAGwALwBzAGUAYwA=')))).CounterSamples[0].InstanceName
for (${2b7693e08c774e268770ba117f3a366c}=1;${2b7693e08c774e268770ba117f3a366c} -le ${1a44679c16c643d0974bd8460542fe68};${2b7693e08c774e268770ba117f3a366c}++) {
    Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAGwAbABlAGMAdABpAG4AZwAgAHAAZQByAGYAbwByAG0AYQBuAGMAZQAgAHMAYQBtAHAAbABlAHMA'))) -Status $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBhAG0AcABsAGUAIAAkAHsAMgBiADcANgA5ADMAZQAwADgAYwA3ADcANABlADIANgA4ADcANwAwAGIAYQAxADEANwBmADMAYQAzADYANgBjAH0AIABvAGYAIAAkAHsAMQBhADQANAA2ADcAOQBjADEANgBjADYANAAzAGQAMAA5ADcANABiAGQAOAA0ADYAMAA1ADQAMgBmAGUANgA4AH0ALgAuAC4A'))) -PercentComplete ((${2b7693e08c774e268770ba117f3a366c}/${1a44679c16c643d0974bd8460542fe68})*100)
    ${d8354bea76a04d739fd609f191e54de9}  = (Get-Counter $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('XABQAHIAbwBjAGUAcwBzAG8AcgAoAF8AVABvAHQAYQBsACkAXAAlACAAUAByAG8AYwBlAHMAcwBvAHIAIABUAGkAbQBlAA==')))).CounterSamples.CookedValue
    ${6d5ebbb96bcf4e55874f27d291306217}  = 100 - ((Get-Counter $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('XABNAGUAbQBvAHIAeQBcAEEAdgBhAGkAbABhAGIAbABlACAATQBCAHkAdABlAHMA')))).CounterSamples.CookedValue / (${3f2aa4209431414d81228a504a383266}*1024)) * 100
    ${2dea8bfd998a475daf2f30cab12244ae} = (Get-Counter $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('XABQAGgAeQBzAGkAYwBhAGwARABpAHMAawAoAF8AVABvAHQAYQBsACkAXAAlACAARABpAHMAawAgAFQAaQBtAGUA')))).CounterSamples.CookedValue
    ${e07af54ab5544205b861c4c9e76e1ce2}  = (Get-Counter $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('XABOAGUAdAB3AG8AcgBrACAASQBuAHQAZQByAGYAYQBjAGUAKAAkAHsAMgBhAGYANgA1AGQAMAA1ADAAZAA1ADkANAA3ADkAYwBiADQAZgA0ADgAOQA5ADEANQA1AGIAOABlAGEAZgA3AH0AKQBcAEIAeQB0AGUAcwAgAFQAbwB0AGEAbAAvAHMAZQBjAA==')))).CounterSamples.CookedValue
    ${cedd44f66fd340ed943263a712c61a7b} += [math]::Round(${d8354bea76a04d739fd609f191e54de9},0)
    ${1335de6364f1443fa77678ed1aedf8b9} += [math]::Round(${6d5ebbb96bcf4e55874f27d291306217},0)
    ${c649edc6c71342d9b11592d2127f7ca5}+= [math]::Round(${2dea8bfd998a475daf2f30cab12244ae},0)
    ${6f92d22e5b3148cea0aaf65d67793990} += [math]::Round(${e07af54ab5544205b861c4c9e76e1ce2}/1KB,0)  
    sleep -Seconds 2
}
${a86262bf487c4566b7d146d35c8fd8a1} = (${cedd44f66fd340ed943263a712c61a7b} | ConvertTo-Json -Compress)
${0a61e2fa351a440096a560ed3f7a4175} = (${1335de6364f1443fa77678ed1aedf8b9} | ConvertTo-Json -Compress)
${6f76c904798e464db404c8ca43477168}= (${c649edc6c71342d9b11592d2127f7ca5}| ConvertTo-Json -Compress)
${fc2a8bffb06d49e895f2bb1c0dbd2179} = (${6f92d22e5b3148cea0aaf65d67793990}| ConvertTo-Json -Compress)
${d37dca35a9d547b4a9d310feb5d3fcca} = (0..(${cedd44f66fd340ed943263a712c61a7b}.Count-1) | % {$_*2} | ConvertTo-Json -Compress)
function a19ead6a6bfe465ba01afaf5ec8063eb(${a31385e961e14553af0585c191dd4d21}, ${cde7912d52f74dacb9b9d43b265f1f44}) {
    if(-not ${a31385e961e14553af0585c191dd4d21}){ return "" }
    ${96173ce592454e53aad294b15fbd4e76} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('PABkAGkAdgAgAGMAbABhAHMAcwA9ACcAdABhAGIAbABlAC0AYwBvAG4AdABhAGkAbgBlAHIAJwA+ADwAaAAzAD4AJAB7AGMAZABlADcAOQAxADIAZAA1ADIAZgA3ADQAZABhAGMAYgA5AGIAOQBkADQAMwBiADIANgA1AGYAMQBmADQANAB9ADwALwBoADMAPgA=')))
    ${96173ce592454e53aad294b15fbd4e76} += (${a31385e961e14553af0585c191dd4d21} | ConvertTo-Html -Fragment | Out-String)
    ${96173ce592454e53aad294b15fbd4e76} += $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('PAAvAGQAaQB2AD4A')))
    return ${96173ce592454e53aad294b15fbd4e76}
}
${96173ce592454e53aad294b15fbd4e76}=@"
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
#backToTop{display:none;position:fixed;bottom:20px;right:20px;background:#E53935;color:#fff;padding:10px 14px;border:none;border-radius:6px;cursor:pointer;}
.valueHeader{color:#fff;}
.valueData{color:#4CAF50;font-weight:bold;}
.logo {margin-top:10px;margin-bottom:30px;text-align:left;}
.logo img{width:260px;height:auto;}
.ddr3{color:#4FC3F7;} .ddr4{color:#00ACC1;} .ddr5{color:#9C27B0;} .unknown{color:#B0BEC5;}
/* Service color coding */
.running {color:#4CAF50;font-weight:bold;}
.stopped {color:#E53935;font-weight:bold;}
.paused {color:#FFB300;font-weight:bold;}
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
new Chart(document.getElementById('cpuChartSummary').getContext('2d'),
{type:'doughnut',data:{labels:['Used','Free'],datasets:[{data:[${52080a1ce5c447e6bb748a672dbe13ee},${8ebe94956ebc4aaa8ece23344e648546}],backgroundColor:['#E53935','#43A047']}]}});
new Chart(document.getElementById('memChartSummary').getContext('2d'),
{type:'doughnut',data:{labels:['Used','Free'],datasets:[{data:[${45d160df8bff4b9b9f6f2b4b9aedd2fe},${7ce95356524b431a930ddf6d1e0fe942}],backgroundColor:['#1E88E5','#757575']}]}});
new Chart(document.getElementById('diskChartSummary').getContext('2d'),
{type:'doughnut',data:{labels:['Used','Free'],datasets:[{data:[${2d6d030ad2614feb93c92b4b03c69ee0},${17f4eaa5be8a411b809955385d7a79dd}],backgroundColor:['#8E24AA','#00897B']}]}});
new Chart(document.getElementById('cpuRealtime').getContext('2d'),
{type:'line',data:{labels:${d37dca35a9d547b4a9d310feb5d3fcca},datasets:[{label:'CPU %',data:${a86262bf487c4566b7d146d35c8fd8a1},borderColor:'#E53935',fill:false}]},options:{scales:{y:{min:0,max:100}}}});
new Chart(document.getElementById('memRealtime').getContext('2d'),
{type:'line',data:{labels:${d37dca35a9d547b4a9d310feb5d3fcca},datasets:[{label:'Memory %',data:${0a61e2fa351a440096a560ed3f7a4175},borderColor:'#1E88E5',fill:false}]},options:{scales:{y:{min:0,max:100}}}});
new Chart(document.getElementById('diskRealtime').getContext('2d'),
{type:'line',data:{labels:${d37dca35a9d547b4a9d310feb5d3fcca},datasets:[{label:'Disk %',data:${6f76c904798e464db404c8ca43477168},borderColor:'#8E24AA',fill:false}]},options:{scales:{y:{min:0,max:100}}}});
new Chart(document.getElementById('netRealtime').getContext('2d'),
{type:'line',data:{labels:${d37dca35a9d547b4a9d310feb5d3fcca},datasets:[{label:'Network KB/s',data:${fc2a8bffb06d49e895f2bb1c0dbd2179},borderColor:'#00ACC1',fill:false}]},options:{scales:{y:{beginAtZero:true}}}});
document.querySelector('.tablink').click();
}
</script>
</head>
<body>
<div class="logo"><img src="https://github.com/cmarko89/static-content/raw/main/logo-transparent-slim.png"></div>
<h1>System Inventory & Performance Report</h1>
<p><span class="valueHeader">Computer:</span> <span class="valueData">$env:COMPUTERNAME</span> &nbsp;&nbsp;
   <span class="valueHeader">Model:</span> <span class="valueData">$(${e83c2afc2fd94f328e12a80077189f70}.Model)</span> &nbsp;&nbsp;
   <span class="valueHeader">User:</span> <span class="valueData">$env:USERNAME</span> &nbsp;&nbsp;
   <span class="valueHeader">Generated:</span> <span class="valueData">$(Get-Date)</span></p>
<div class="tab">
<button class="tablink" onclick="openTab(event,'Summary')">Summary</button>
<button class="tablink" onclick="openTab(event,'Performance')">Performance</button>
<button class="tablink" onclick="openTab(event,'Disks')">Disks</button>
<button class="tablink" onclick="openTab(event,'Network')">Network</button>
<button class="tablink" onclick="openTab(event,'Printers')">Printers</button>
<button class="tablink" onclick="openTab(event,'Services')">Services</button>
</div>

<div id="Summary" class="tabcontent">
<div class="dashboard">
  <div class="card"><h2>CPU</h2><canvas id="cpuChartSummary"></canvas><p>${52080a1ce5c447e6bb748a672dbe13ee}% Utilization</p></div>
  <div class="card"><h2>Memory</h2><canvas id="memChartSummary"></canvas><p>${8bf2dc401b1445628ea7ef918092c8f7}% Utilization<br/>${45d160df8bff4b9b9f6f2b4b9aedd2fe} / ${3f2aa4209431414d81228a504a383266} GB</p></div>
  <div class="card"><h2>Disk</h2><canvas id="diskChartSummary"></canvas><p>${e22221c4f2b64ffaa973de1b9eb79f50}% Used<br/>Total: $([math]::Round(${4350fa93db68444795027de91f0c1413}/1GB,2)) GB</p></div>
  <div class="card"><h2>System</h2>
   <p><b>OS:</b> $(${ca09ec8e54f441cbb897d3e7d3186667}.Caption) ($(${ca09ec8e54f441cbb897d3e7d3186667}.OSArchitecture))</p>
   <p><b>CPU:</b> $(${302dc8f6ba1644b4806af920d5b01841}.Name) (${d4b2396c01bf40249289161545b44807})</p>
   <p><b>GPU:</b><br/> ${1ed8468541c94aeaa7bb1db51da63883}</p>
   <p><b>Memory:</b><br/> ${79c8cee1eee74fae912f7485a80f1b1e}</p>
   <p><b>Motherboard:</b> ${7f7e5eb004dc4210ac90658abdc7b4f6}</p>
   <p><b>Disks:</b><br/> ${d574959ab60049268b52c0357456fe23}</p>
   <p><b>Uptime:</b> $([string]::Format($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ewAwADoAJQBkAH0AZAAgAHsAMAA6ACUAaAB9AGgAIAB7ADAAOgAlAG0AfQBtAA=='))),${6c0432df93b34227a5bfea60e8123af8}))</p>
   <p><b>Printers:</b> $(${251a4370d4f6424aa37fbfa200b7441a}.Count) | <b>USB Devices:</b> $(${c5f5eb90904e4d89967fdbb73377a61e}.Count)</p>
   <p><b>Services:</b> $(${60b86701419f4686b0041aff4952dfe9}.Count)</p>
  </div>
</div>
</div>

<div id="Performance" class="tabcontent">
<h3>CPU / Memory / Disk / Network (last 30s samples)</h3>
<canvas id="cpuRealtime" height="120"></canvas>
<canvas id="memRealtime" height="120"></canvas>
<canvas id="diskRealtime" height="120"></canvas>
<canvas id="netRealtime" height="120"></canvas>
</div>

<div id="Disks" class="tabcontent">
$(a19ead6a6bfe465ba01afaf5ec8063eb (${8b2694cb577e4b9a91302dd70590d5cc}|Select DeviceID,VolumeName,@{n=$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBpAHoAZQBHAEIA')));e={[math]::Round($_.Size/1GB,2)}},@{n=$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgByAGUAZQBHAEIA')));e={[math]::Round($_.FreeSpace/1GB,2)}}) $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TABvAGcAaQBjAGEAbAAgAEQAaQBzAGsAcwA='))))
$(a19ead6a6bfe465ba01afaf5ec8063eb ${efbeb80be4584434869893090a1806fc} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABoAHkAcwBpAGMAYQBsACAARABpAHMAawBzACAAKABTAE0AQQBSAFQALwBTAGUAcgBpAGEAbAAvAEYAaQByAG0AdwBhAHIAZQApAA=='))))
</div>

<div id="Network" class="tabcontent">$(a19ead6a6bfe465ba01afaf5ec8063eb ${6132aa9d2e8f4f0cbc9bb2bdafc98f51} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBlAHQAdwBvAHIAawAgAEkAbgB0AGUAcgBmAGEAYwBlAHMA'))))</div>
<div id="Printers" class="tabcontent">$(a19ead6a6bfe465ba01afaf5ec8063eb ${251a4370d4f6424aa37fbfa200b7441a} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAByAGkAbgB0AGUAcgBzACAAKABNAGkAbgBpAG0AYQBsACkA'))))</div>
<div id="Services" class="tabcontent">
<h3>Services Overview</h3>
<div class='table-container'>
<table>
<tr><th>Name</th><th>Display Name</th><th>Status</th><th>StartType</th></tr>
$(
    ${60b86701419f4686b0041aff4952dfe9} | Sort Status,Name | % {
        ${7b8a7667bfdf40cfbb05519782e0cd07} = switch ($_.Status) {
            $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgB1AG4AbgBpAG4AZwA='))) {$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgB1AG4AbgBpAG4AZwA=')))}
            $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwB0AG8AcABwAGUAZAA='))) {$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwB0AG8AcABwAGUAZAA=')))}
            $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UABhAHUAcwBlAGQA')))  {$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cABhAHUAcwBlAGQA')))}
            default   {$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('dQBuAGsAbgBvAHcAbgA=')))}
        }
        "<tr><td>$($_.Name)</td><td>$($_.DisplayName)</td><td><span class='${7b8a7667bfdf40cfbb05519782e0cd07}'>$($_.Status)</span></td><td>$($_.StartType)</td></tr>"
    }
)
</table>
</div>
</div>

<button onclick="topFunction()" id="backToTop">TOP</button>
<div class="footer">Report generated by Emkraan</div>
</body>
</html>
"@
${96173ce592454e53aad294b15fbd4e76} | sc ${a24b2a9da61e4006ab88ce9dc5ee00f7} -Encoding UTF8
saps ${a24b2a9da61e4006ab88ce9dc5ee00f7}
Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SABUAE0ATAAgAHIAZQBwAG8AcgB0ACAAcwBhAHYAZQBkACAAdABvACAAJAB7AGEAMgA0AGIAMgBhADkAZABhADYAMQBlADQAMAAwADYAYQBiADgAOABjAGUAOQBkAGMANQBlAGUAMAAwAGYANwB9AA=='))) -ForegroundColor Green