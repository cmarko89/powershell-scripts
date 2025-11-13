
Add-Type -AssemblyName System.Windows.Forms
function ___/=\__/\_/\__/== {
    try {
        gcm systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}
function __/=\_______/\__/\ {
    param (
        [string]${__/\/\___/\_/===\/},
        [string]${_____/=\/=\/=\/\/\}
    )
    try {
        ${_/=\__/=\_/====\_} = New-Object System.Net.WebClient
        ${_/=\__/=\_/====\_}.DownloadProgressChanged += {
            Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Status ($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ewAwAH0AJQA='))) -f $_.ProgressPercentage) -PercentComplete $_.ProgressPercentage
        }
        ${_/=\__/=\_/====\_}.DownloadFileAsync(${__/\/\___/\_/===\/}, ${_____/=\/=\/=\/\/\})
        while (${_/=\__/=\_/====\_}.IsBusy) { sleep -Milliseconds 500 }
        Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Completed
        return $true
    } catch {
        return $false
    }
}
if (___/=\__/\_/\__/==) {
    ${/====\_/=====\___} = New-Object System.Windows.Forms.Form
    ${/====\_/=====\___}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VwBpAG4AZABvAHcAcwAgAFIAZQBzAGUAdAAgAE8AcAB0AGkAbwBuAHMA')))
    ${/====\_/=====\___}.Size = New-Object Drawing.Size(350,150)
    ${/====\_/=====\___}.StartPosition = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBlAG4AdABlAHIAUwBjAHIAZQBlAG4A')))
    ${__/\_/===\__/===\} = New-Object System.Windows.Forms.Label
    ${__/\_/===\__/===\}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAG8AbwBzAGUAIABoAG8AdwAgAHQAbwAgAHIAZQBmAHIAZQBzAGgAIAB0AGgAaQBzACAAUABDADoA')))
    ${__/\_/===\__/===\}.AutoSize = $true
    ${__/\_/===\__/===\}.Location = New-Object Drawing.Point(10,20)
    ${/====\_/=====\___}.Controls.Add(${__/\_/===\__/===\})
    ${__/\/\/\__/\/\__/} = New-Object System.Windows.Forms.Button
    ${__/\/\/\__/\/\__/}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UQB1AGkAYwBrACAAUgBlAHMAZQB0AA==')))
    ${__/\/\/\__/\/\__/}.Location = New-Object Drawing.Point(30,60)
    ${__/\/\/\__/\/\__/}.Add_Click({
        ${/====\_/=====\___}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))
        ${/====\_/=====\___}.Close()
    })
    ${/====\_/=====\___}.Controls.Add(${__/\/\/\__/\/\__/})
    ${_______/\_/=\__/\} = New-Object System.Windows.Forms.Button
    ${_______/\_/=\__/\}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgB1AGwAbAAgAFIAZQBpAG4AcwB0AGEAbABsAA==')))
    ${_______/\_/=\__/\}.Location = New-Object Drawing.Point(150,60)
    ${_______/\_/=\__/\}.Add_Click({
        ${/====\_/=====\___}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))
        ${/====\_/=====\___}.Close()
    })
    ${/====\_/=====\___}.Controls.Add(${_______/\_/=\__/\})
    ${/====\_/=====\___}.ShowDialog() | Out-Null
    if (${/====\_/=====\___}.Tag -eq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgB1AG4AbgBpAG4AZwAgAFcAaQBuAGQAbwB3AHMAIABSAGUAcwBlAHQALgAuAC4A')))
        saps $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwB5AHMAdABlAG0AcgBlAHMAZQB0AC4AZQB4AGUA'))) -ArgumentList $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LQBmAGEAYwB0AG8AcgB5AHIAZQBzAGUAdAA=')))
        exit
    }
    elseif (${/====\_/=====\___}.Tag -ne $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))) {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAAYwBoAG8AaQBjAGUAIABtAGEAZABlAC4AIABFAHgAaQB0AGkAbgBnAC4A')))
        exit
    }
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAByAGUAcABhAHIAaQBuAGcAIABGAHUAbABsACAAUgBlAGkAbgBzAHQAYQBsAGwAIAB2AGkAYQAgAHMAZQB0AHUAcAAuAGUAeABlAC4ALgAuAA==')))
${__/====\_/=\/\___} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAHMAbwBmAHQAdwBhAHIAZQAtAHMAdABhAHQAaQBjAC4AZABvAHcAbgBsAG8AYQBkAC4AcAByAHMAcwAuAG0AaQBjAHIAbwBzAG8AZgB0AC4AYwBvAG0ALwBkAGIAYQB6AHUAcgBlAC8AOAA4ADgAOQA2ADkAZAA1AC0AZgAzADQAZwAtADQAZQAwADMALQBhAGMAOQBkAC0AMQBmADkANwA4ADYAYwA2ADYANwA0ADkALwAyADYAMgAwADAALgA2ADUAOAA0AC4AMgA1ADAAOQAxADUALQAxADkAMAA1AC4AMgA1AGgAMgBfAGcAZQBfAHIAZQBsAGUAYQBzAGUAXwBzAHYAYwBfAHIAZQBmAHIAZQBzAGgAXwBDAEwASQBFAE4AVABfAEMATwBOAFMAVQBNAEUAUgBfAHgANgA0AEYAUgBFAF8AZQBuAC0AdQBzAC4AaQBzAG8A')))   
${___/=====\_/\__/=}  = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFQARQBNAFAAXABXAGkAbgAxADEALgBpAHMAbwA=')))
${_/===\___/\/=\/\_} = $null
${__/===\_/\/\_____} = $false
if (${__/====\_/=\/\___} -ne "") {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VAByAHkAaQBuAGcAIABkAGkAcgBlAGMAdAAgAEkAUwBPACAAZABvAHcAbgBsAG8AYQBkACAAZgByAG8AbQAgAE0AaQBjAHIAbwBzAG8AZgB0AC4ALgAuAA==')))
    ${__/===\_/\/\_____} = __/=\_______/\__/\ -__/\/\___/\_/===\/ ${__/====\_/=\/\___} -_____/=\/=\/=\/\/\ ${___/=====\_/\__/=}
    if (${__/===\_/\/\_____} -and (Test-Path ${___/=====\_/\__/=})) {
        ${_/===\___/\/=\/\_} = ${___/=====\_/\__/=}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABkAG8AdwBuAGwAbwBhAGQAZQBkACAAcwB1AGMAYwBlAHMAcwBmAHUAbABsAHkAIAB0AG8AIAAkAHsAXwAvAD0APQA9AFwAXwBfAF8ALwBcAC8APQBcAC8AXABfAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABpAHIAZQBjAHQAIABJAFMATwAgAGQAbwB3AG4AbABvAGEAZAAgAGYAYQBpAGwAZQBkACAAKABsAGkAbgBrACAAbQBhAHkAIABoAGEAdgBlACAAZQB4AHAAaQByAGUAZAApAC4A')))
    }
}
if (-not ${_/===\___/\/=\/\_}) {
    ${/==\/==\/\/=\__/=} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwAVwBpAG4AMQAxAC4AaQBzAG8A')))
    if (Test-Path ${/==\/==\/\/=\__/=}) {
        ${_/===\___/\/=\/\_} = ${/==\/==\/\/=\__/=}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBzAGkAbgBnACAAZQB4AGkAcwB0AGkAbgBnACAASQBTAE8AOgAgACQAewBfAC8APQA9AD0AXABfAF8AXwAvAFwALwA9AFwALwBcAF8AfQA=')))
    }
}
if (-not ${_/===\___/\/=\/\_}) {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBhAGwAbABpAG4AZwAgAGIAYQBjAGsAIAB0AG8AIABNAGUAZABpAGEAIABDAHIAZQBhAHQAaQBvAG4AIABUAG8AbwBsAC4ALgAuAA==')))
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    ${/====\/=\/\/==\/\} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwATQBlAGQAaQBhAEMAcgBlAGEAdABpAG8AbgBUAG8AbwBsAF8AVwBpAG4AMQAxAC4AZQB4AGUA')))
    ${/==\______/==\___} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGcAbwAuAG0AaQBjAHIAbwBzAG8AZgB0AC4AYwBvAG0ALwBmAHcAbABpAG4AawAvAD8AbABpAG4AawBpAGQAPQAyADEANQA2ADIAOQA1AA==')))
    if (-Not (Test-Path ${/====\/=\/\/==\/\})) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAATQBlAGQAaQBhACAAQwByAGUAYQB0AGkAbwBuACAAVABvAG8AbAAuAC4ALgA=')))
        iwr -Uri ${/==\______/==\___} -OutFile ${/====\/=\/\/==\/\} -UseBasicParsing
    }
    ${/=\__/\/\/==\/\_/} = saps -FilePath ${/====\/=\/\/==\/\} -PassThru -Verb RunAs
    ${/=\__/\/\/==\/\_/}.WaitForExit()
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBDAFQAIABjAGwAbwBzAGUAZAAuACAAUABsAGUAYQBzAGUAIABzAGUAbABlAGMAdAAgAEkAUwBPACAAZgBpAGwAZQAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAAuAA==')))
    ${_/\___/\_/\/=\_/\} = New-Object System.Windows.Forms.OpenFileDialog
    ${_/\___/\_/\/=\_/\}.Filter = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABGAGkAbABlAHMAIAAoACoALgBpAHMAbwApAHwAIAAqAC4AaQBzAG8A')))
    ${_/\___/\_/\/=\_/\}.Title = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAIAB0AGgAZQAgAFcAaQBuAGQAbwB3AHMAIAAxADEAIABJAFMATwAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAA=')))
    if (${_/\___/\_/\/=\_/\}.ShowDialog() -eq "OK") {
        ${_/===\___/\/=\/\_} = ${_/\___/\_/\/=\_/\}.FileName
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAZQBkADoAIAAkAHsAXwAvAD0APQA9AFwAXwBfAF8ALwBcAC8APQBcAC8AXABfAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAASQBTAE8AIABzAGUAbABlAGMAdABlAGQALgAgAEUAeABpAHQAaQBuAGcALgA=')))
        exit
    }
}
if (-not (Test-Path ${_/===\___/\/=\/\_})) {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHUAbABkACAAbgBvAHQAIABmAGkAbgBkACAAbwByACAAZABvAHcAbgBsAG8AYQBkACAASQBTAE8ALgAgAEUAeABpAHQAaQBuAGcALgA=')))
    exit
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBvAHUAbgB0AGkAbgBnACAASQBTAE8ALgAuAC4A')))
${__/==\_/\_/======} = Mount-DiskImage -ImagePath ${_/===\___/\/=\/\_} -PassThru
${/==\__/\/=\/\/===} = (${__/==\_/\_/======} | Get-Volume).DriveLetter + ":"
${___/====\__/===\/} = Join-Path ${/==\__/\/=\/\/===} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUA')))
if (Test-Path ${___/====\__/===\/}) {
    ${/=\/\/==\_/\_/\/\} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LwBhAHUAdABvACAAYwBsAGUAYQBuACAALwBkAHkAbgBhAG0AaQBjAHUAcABkAGEAdABlACAAZABpAHMAYQBiAGwAZQAgAC8AZQB1AGwAYQAgAGEAYwBjAGUAcAB0ACAALwB1AG4AaQBuAHMAdABhAGwAbAAgAGQAaQBzAGEAYgBsAGUA')))
        saps -FilePath ${___/====\__/===\/} -ArgumentList ${/=\/\/==\_/\_/\/\} -Verb RunAs
} else {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUAIABuAG8AdAAgAGYAbwB1AG4AZAAgAGkAbgAgAG0AbwB1AG4AdABlAGQAIABJAFMATwAhAA==')))
}