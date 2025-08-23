
Add-Type -AssemblyName System.Windows.Forms
function d40dd8e470a94906b2653e4b7de72122 {
    try {
        gcm systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}
function c164b1793a814af8b1bdce9281be550e {
    param (
        [string]${ada9a6fdefcf4eb09807bc0e088b4845},
        [string]${c0fd24557ffd4d0aa76a9466c40f38ba}
    )
    try {
        ${707baa20feef4e7187b132181b9db439} = New-Object System.Net.WebClient
        ${707baa20feef4e7187b132181b9db439}.DownloadProgressChanged += {
            Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Status ($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ewAwAH0AJQA='))) -f $_.ProgressPercentage) -PercentComplete $_.ProgressPercentage
        }
        ${707baa20feef4e7187b132181b9db439}.DownloadFileAsync(${ada9a6fdefcf4eb09807bc0e088b4845}, ${c0fd24557ffd4d0aa76a9466c40f38ba})
        while (${707baa20feef4e7187b132181b9db439}.IsBusy) { sleep -Milliseconds 500 }
        Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Completed
        return $true
    } catch {
        return $false
    }
}
if (d40dd8e470a94906b2653e4b7de72122) {
    ${6ff729e34bd34b1ebb41a51558180e45} = New-Object System.Windows.Forms.Form
    ${6ff729e34bd34b1ebb41a51558180e45}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VwBpAG4AZABvAHcAcwAgAFIAZQBzAGUAdAAgAE8AcAB0AGkAbwBuAHMA')))
    ${6ff729e34bd34b1ebb41a51558180e45}.Size = New-Object Drawing.Size(350,150)
    ${6ff729e34bd34b1ebb41a51558180e45}.StartPosition = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBlAG4AdABlAHIAUwBjAHIAZQBlAG4A')))
    ${2d0fe68e2de14a72bad694cc1a4da5a4} = New-Object System.Windows.Forms.Label
    ${2d0fe68e2de14a72bad694cc1a4da5a4}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAG8AbwBzAGUAIABoAG8AdwAgAHQAbwAgAHIAZQBmAHIAZQBzAGgAIAB0AGgAaQBzACAAUABDADoA')))
    ${2d0fe68e2de14a72bad694cc1a4da5a4}.AutoSize = $true
    ${2d0fe68e2de14a72bad694cc1a4da5a4}.Location = New-Object Drawing.Point(10,20)
    ${6ff729e34bd34b1ebb41a51558180e45}.Controls.Add(${2d0fe68e2de14a72bad694cc1a4da5a4})
    ${0a2c65a3aa7c4315bfd79c9804eefc81} = New-Object System.Windows.Forms.Button
    ${0a2c65a3aa7c4315bfd79c9804eefc81}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UQB1AGkAYwBrACAAUgBlAHMAZQB0AA==')))
    ${0a2c65a3aa7c4315bfd79c9804eefc81}.Location = New-Object Drawing.Point(30,60)
    ${0a2c65a3aa7c4315bfd79c9804eefc81}.Add_Click({
        ${6ff729e34bd34b1ebb41a51558180e45}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))
        ${6ff729e34bd34b1ebb41a51558180e45}.Close()
    })
    ${6ff729e34bd34b1ebb41a51558180e45}.Controls.Add(${0a2c65a3aa7c4315bfd79c9804eefc81})
    ${d67520c362bb44cb8028712c74eedde7} = New-Object System.Windows.Forms.Button
    ${d67520c362bb44cb8028712c74eedde7}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgB1AGwAbAAgAFIAZQBpAG4AcwB0AGEAbABsAA==')))
    ${d67520c362bb44cb8028712c74eedde7}.Location = New-Object Drawing.Point(150,60)
    ${d67520c362bb44cb8028712c74eedde7}.Add_Click({
        ${6ff729e34bd34b1ebb41a51558180e45}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))
        ${6ff729e34bd34b1ebb41a51558180e45}.Close()
    })
    ${6ff729e34bd34b1ebb41a51558180e45}.Controls.Add(${d67520c362bb44cb8028712c74eedde7})
    ${6ff729e34bd34b1ebb41a51558180e45}.ShowDialog() | Out-Null
    if (${6ff729e34bd34b1ebb41a51558180e45}.Tag -eq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgB1AG4AbgBpAG4AZwAgAFcAaQBuAGQAbwB3AHMAIABSAGUAcwBlAHQALgAuAC4A')))
        saps $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwB5AHMAdABlAG0AcgBlAHMAZQB0AC4AZQB4AGUA'))) -ArgumentList $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LQBmAGEAYwB0AG8AcgB5AHIAZQBzAGUAdAA=')))
        exit
    }
    elseif (${6ff729e34bd34b1ebb41a51558180e45}.Tag -ne $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))) {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAAYwBoAG8AaQBjAGUAIABtAGEAZABlAC4AIABFAHgAaQB0AGkAbgBnAC4A')))
        exit
    }
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAByAGUAcABhAHIAaQBuAGcAIABGAHUAbABsACAAUgBlAGkAbgBzAHQAYQBsAGwAIAB2AGkAYQAgAHMAZQB0AHUAcAAuAGUAeABlAC4ALgAuAA==')))
${fae114e3279e4397ae233791f0cf1cd2} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGQAbgA3ADIAMQA2ADAANwAuAGMAYQAuAGEAcgBjAGgAaQB2AGUALgBvAHIAZwAvADAALwBpAHQAZQBtAHMALwB3AGkAbgBkAG8AdwBzAC0AMQAxAC0AMgA0AGgAMgAtAGkAcwBvAF8AMgAwADIANQAwADEALwBXAGkAbgAxADEAXwAyADQASAAyAF8ARQBuAGcAbABpAHMAaABfAHgANgA0AC4AaQBzAG8A')))   
${e9a30f245de74978b320daf750b88a17}  = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFQARQBNAFAAXABXAGkAbgAxADEALgBpAHMAbwA=')))
${2a87d4b5db7d439c832ea3ef53f9a8da} = $null
${cc1a157ed06947f6acc39f549d68b3c5} = $false
if (${fae114e3279e4397ae233791f0cf1cd2} -ne "") {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VAByAHkAaQBuAGcAIABkAGkAcgBlAGMAdAAgAEkAUwBPACAAZABvAHcAbgBsAG8AYQBkACAAZgByAG8AbQAgAE0AaQBjAHIAbwBzAG8AZgB0AC4ALgAuAA==')))
    ${cc1a157ed06947f6acc39f549d68b3c5} = c164b1793a814af8b1bdce9281be550e -ada9a6fdefcf4eb09807bc0e088b4845 ${fae114e3279e4397ae233791f0cf1cd2} -c0fd24557ffd4d0aa76a9466c40f38ba ${e9a30f245de74978b320daf750b88a17}
    if (${cc1a157ed06947f6acc39f549d68b3c5} -and (Test-Path ${e9a30f245de74978b320daf750b88a17})) {
        ${2a87d4b5db7d439c832ea3ef53f9a8da} = ${e9a30f245de74978b320daf750b88a17}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABkAG8AdwBuAGwAbwBhAGQAZQBkACAAcwB1AGMAYwBlAHMAcwBmAHUAbABsAHkAIAB0AG8AIAAkAHsAMgBhADgANwBkADQAYgA1AGQAYgA3AGQANAAzADkAYwA4ADMAMgBlAGEAMwBlAGYANQAzAGYAOQBhADgAZABhAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABpAHIAZQBjAHQAIABJAFMATwAgAGQAbwB3AG4AbABvAGEAZAAgAGYAYQBpAGwAZQBkACAAKABsAGkAbgBrACAAbQBhAHkAIABoAGEAdgBlACAAZQB4AHAAaQByAGUAZAApAC4A')))
    }
}
if (-not ${2a87d4b5db7d439c832ea3ef53f9a8da}) {
    ${26a59bd5523b471b8869782758708808} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwAVwBpAG4AMQAxAC4AaQBzAG8A')))
    if (Test-Path ${26a59bd5523b471b8869782758708808}) {
        ${2a87d4b5db7d439c832ea3ef53f9a8da} = ${26a59bd5523b471b8869782758708808}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBzAGkAbgBnACAAZQB4AGkAcwB0AGkAbgBnACAASQBTAE8AOgAgACQAewAyAGEAOAA3AGQANABiADUAZABiADcAZAA0ADMAOQBjADgAMwAyAGUAYQAzAGUAZgA1ADMAZgA5AGEAOABkAGEAfQA=')))
    }
}
if (-not ${2a87d4b5db7d439c832ea3ef53f9a8da}) {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBhAGwAbABpAG4AZwAgAGIAYQBjAGsAIAB0AG8AIABNAGUAZABpAGEAIABDAHIAZQBhAHQAaQBvAG4AIABUAG8AbwBsAC4ALgAuAA==')))
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    ${8edf5faf258347848d15074b572dce7f} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwATQBlAGQAaQBhAEMAcgBlAGEAdABpAG8AbgBUAG8AbwBsAF8AVwBpAG4AMQAxAC4AZQB4AGUA')))
    ${6e80e9a8fb414f5e831a8a7a6ca41acd} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGcAbwAuAG0AaQBjAHIAbwBzAG8AZgB0AC4AYwBvAG0ALwBmAHcAbABpAG4AawAvAD8AbABpAG4AawBpAGQAPQAyADEANQA2ADIAOQA1AA==')))
    if (-Not (Test-Path ${8edf5faf258347848d15074b572dce7f})) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAATQBlAGQAaQBhACAAQwByAGUAYQB0AGkAbwBuACAAVABvAG8AbAAuAC4ALgA=')))
        iwr -Uri ${6e80e9a8fb414f5e831a8a7a6ca41acd} -OutFile ${8edf5faf258347848d15074b572dce7f} -UseBasicParsing
    }
    ${80641f56ec0c4ec68331758d084b66fd} = saps -FilePath ${8edf5faf258347848d15074b572dce7f} -PassThru -Verb RunAs
    ${80641f56ec0c4ec68331758d084b66fd}.WaitForExit()
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBDAFQAIABjAGwAbwBzAGUAZAAuACAAUABsAGUAYQBzAGUAIABzAGUAbABlAGMAdAAgAEkAUwBPACAAZgBpAGwAZQAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAAuAA==')))
    ${2aeebed710cf42b7a848f7e22c5bedde} = New-Object System.Windows.Forms.OpenFileDialog
    ${2aeebed710cf42b7a848f7e22c5bedde}.Filter = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABGAGkAbABlAHMAIAAoACoALgBpAHMAbwApAHwAIAAqAC4AaQBzAG8A')))
    ${2aeebed710cf42b7a848f7e22c5bedde}.Title = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAIAB0AGgAZQAgAFcAaQBuAGQAbwB3AHMAIAAxADEAIABJAFMATwAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAA=')))
    if (${2aeebed710cf42b7a848f7e22c5bedde}.ShowDialog() -eq "OK") {
        ${2a87d4b5db7d439c832ea3ef53f9a8da} = ${2aeebed710cf42b7a848f7e22c5bedde}.FileName
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAZQBkADoAIAAkAHsAMgBhADgANwBkADQAYgA1AGQAYgA3AGQANAAzADkAYwA4ADMAMgBlAGEAMwBlAGYANQAzAGYAOQBhADgAZABhAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAASQBTAE8AIABzAGUAbABlAGMAdABlAGQALgAgAEUAeABpAHQAaQBuAGcALgA=')))
        exit
    }
}
if (-not (Test-Path ${2a87d4b5db7d439c832ea3ef53f9a8da})) {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHUAbABkACAAbgBvAHQAIABmAGkAbgBkACAAbwByACAAZABvAHcAbgBsAG8AYQBkACAASQBTAE8ALgAgAEUAeABpAHQAaQBuAGcALgA=')))
    exit
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBvAHUAbgB0AGkAbgBnACAASQBTAE8ALgAuAC4A')))
${93b70093a7984f0882454de4942dd129} = Mount-DiskImage -ImagePath ${2a87d4b5db7d439c832ea3ef53f9a8da} -PassThru
${9790e73fcf344b9681833f29cc88376f} = (${93b70093a7984f0882454de4942dd129} | Get-Volume).DriveLetter + ":"
${d2a554085d7b43cba7936d9a108e7489} = Join-Path ${9790e73fcf344b9681833f29cc88376f} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUA')))
if (Test-Path ${d2a554085d7b43cba7936d9a108e7489}) {
    ${b95cd9169a64478e80b9a13403788bb5} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LwBhAHUAdABvACAAYwBsAGUAYQBuACAALwBkAHkAbgBhAG0AaQBjAHUAcABkAGEAdABlACAAZABpAHMAYQBiAGwAZQAgAC8AZQB1AGwAYQAgAGEAYwBjAGUAcAB0ACAALwB1AG4AaQBuAHMAdABhAGwAbAAgAGQAaQBzAGEAYgBsAGUA')))
        saps -FilePath ${d2a554085d7b43cba7936d9a108e7489} -ArgumentList ${b95cd9169a64478e80b9a13403788bb5} -Verb RunAs
} else {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUAIABuAG8AdAAgAGYAbwB1AG4AZAAgAGkAbgAgAG0AbwB1AG4AdABlAGQAIABJAFMATwAhAA==')))
}