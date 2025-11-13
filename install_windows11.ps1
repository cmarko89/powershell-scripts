
Add-Type -AssemblyName System.Windows.Forms
function __/\/\_/==\____/\_ {
    try {
        gcm systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}
function ______/=======\_/= {
    param (
        [string]${__/=\/===\/\_/\_/=},
        [string]${_/=\/=\/==\____/=\}
    )
    try {
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAAZgByAG8AbQAgACQAewBfAF8ALwA9AFwALwA9AD0APQBcAC8AXABfAC8AXABfAC8APQB9AC4ALgAuAA==')))
        iwr -Uri ${__/=\/===\/\_/\_/=} -OutFile ${_/=\/=\/==\____/=\} -UseBasicParsing -Verbose:$false
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkACAAYwBvAG0AcABsAGUAdABlADoAIAAkAHsAXwAvAD0AXAAvAD0AXAAvAD0APQBcAF8AXwBfAF8ALwA9AFwAfQA=')))
        return $true
    } catch {
        Write-Warning $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkACAAZgBhAGkAbABlAGQAOgAgACQAXwA=')))
        return $false
    }
}
if (__/\/\_/==\____/\_) {
    ${_/\/=\/\________/} = New-Object System.Windows.Forms.Form
    ${_/\/=\/\________/}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VwBpAG4AZABvAHcAcwAgAFIAZQBzAGUAdAAgAE8AcAB0AGkAbwBuAHMA')))
    ${_/\/=\/\________/}.Size = New-Object Drawing.Size(350,150)
    ${_/\/=\/\________/}.StartPosition = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBlAG4AdABlAHIAUwBjAHIAZQBlAG4A')))
    ${__/\_/\/=\__/\/\_} = New-Object System.Windows.Forms.Label
    ${__/\_/\/=\__/\/\_}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAG8AbwBzAGUAIABoAG8AdwAgAHQAbwAgAHIAZQBmAHIAZQBzAGgAIAB0AGgAaQBzACAAUABDADoA')))
    ${__/\_/\/=\__/\/\_}.AutoSize = $true
    ${__/\_/\/=\__/\/\_}.Location = New-Object Drawing.Point(10,20)
    ${_/\/=\/\________/}.Controls.Add(${__/\_/\/=\__/\/\_})
    ${/=\_/=\/==\/\/=\_} = New-Object System.Windows.Forms.Button
    ${/=\_/=\/==\/\/=\_}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UQB1AGkAYwBrACAAUgBlAHMAZQB0AA==')))
    ${/=\_/=\/==\/\/=\_}.Location = New-Object Drawing.Point(30,60)
    ${/=\_/=\/==\/\/=\_}.Add_Click({
        ${_/\/=\/\________/}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))
        ${_/\/=\/\________/}.Close()
    })
    ${_/\/=\/\________/}.Controls.Add(${/=\_/=\/==\/\/=\_})
    ${_/\___/=\/\/=\/==} = New-Object System.Windows.Forms.Button
    ${_/\___/=\/\/=\/==}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgB1AGwAbAAgAFIAZQBpAG4AcwB0AGEAbABsAA==')))
    ${_/\___/=\/\/=\/==}.Location = New-Object Drawing.Point(150,60)
    ${_/\___/=\/\/=\/==}.Add_Click({
        ${_/\/=\/\________/}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))
        ${_/\/=\/\________/}.Close()
    })
    ${_/\/=\/\________/}.Controls.Add(${_/\___/=\/\/=\/==})
    ${_/\/=\/\________/}.ShowDialog() | Out-Null
    if (${_/\/=\/\________/}.Tag -eq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgB1AG4AbgBpAG4AZwAgAFcAaQBuAGQAbwB3AHMAIABSAGUAcwBlAHQALgAuAC4A')))
        saps $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwB5AHMAdABlAG0AcgBlAHMAZQB0AC4AZQB4AGUA'))) -ArgumentList $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LQBmAGEAYwB0AG8AcgB5AHIAZQBzAGUAdAA=')))
        exit
    }
    elseif (${_/\/=\/\________/}.Tag -ne $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))) {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAAYwBoAG8AaQBjAGUAIABtAGEAZABlAC4AIABFAHgAaQB0AGkAbgBnAC4A')))
        exit
    }
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAByAGUAcABhAHIAaQBuAGcAIABGAHUAbABsACAAUgBlAGkAbgBzAHQAYQBsAGwAIAB2AGkAYQAgAHMAZQB0AHUAcAAuAGUAeABlAC4ALgAuAA==')))
${/=\_/===\/=\_/\__} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAHMAbwBmAHQAdwBhAHIAZQAtAHMAdABhAHQAaQBjAC4AZABvAHcAbgBsAG8AYQBkAC4AcAByAHMAcwAuAG0AaQBjAHIAbwBzAG8AZgB0AC4AYwBvAG0ALwBkAGIAYQB6AHUAcgBlAC8AOAA4ADgAOQA2ADkAZAA1AC0AZgAzADQAZwAtADQAZQAwADMALQBhAGMAOQBkAC0AMQBmADkANwA4ADYAYwA2ADYANwA0ADkALwAyADYAMgAwADAALgA2ADUAOAA0AC4AMgA1ADAAOQAxADUALQAxADkAMAA1AC4AMgA1AGgAMgBfAGcAZQBfAHIAZQBsAGUAYQBzAGUAXwBzAHYAYwBfAHIAZQBmAHIAZQBzAGgAXwBDAEwASQBFAE4AVABfAEMATwBOAFMAVQBNAEUAUgBfAHgANgA0AEYAUgBFAF8AZQBuAC0AdQBzAC4AaQBzAG8A')))   
${/====\/\_/\/\_/\_}  = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFQARQBNAFAAXABXAGkAbgAxADEALgBpAHMAbwA=')))
${/=\/\/\___/\_/\/=} = $null
${/=\__/=\/\/\/\/=\} = $false
if (${/=\_/===\/=\_/\__} -ne "") {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VAByAHkAaQBuAGcAIABkAGkAcgBlAGMAdAAgAEkAUwBPACAAZABvAHcAbgBsAG8AYQBkACAAZgByAG8AbQAgAE0AaQBjAHIAbwBzAG8AZgB0AC4ALgAuAA==')))
    ${/=\__/=\/\/\/\/=\} = ______/=======\_/= -__/=\/===\/\_/\_/= ${/=\_/===\/=\_/\__} -_/=\/=\/==\____/=\ ${/====\/\_/\/\_/\_}
    if (${/=\__/=\/\/\/\/=\} -and (Test-Path ${/====\/\_/\/\_/\_})) {
        ${/=\/\/\___/\_/\/=} = ${/====\/\_/\/\_/\_}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABkAG8AdwBuAGwAbwBhAGQAZQBkACAAcwB1AGMAYwBlAHMAcwBmAHUAbABsAHkAIAB0AG8AIAAkAHsALwA9AFwALwBcAC8AXABfAF8AXwAvAFwAXwAvAFwALwA9AH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABpAHIAZQBjAHQAIABJAFMATwAgAGQAbwB3AG4AbABvAGEAZAAgAGYAYQBpAGwAZQBkACAAKABsAGkAbgBrACAAbQBhAHkAIABoAGEAdgBlACAAZQB4AHAAaQByAGUAZAApAC4A')))
    }
}
if (-not ${/=\/\/\___/\_/\/=}) {
    ${/=\/===\/\_/\/=\_} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwAVwBpAG4AMQAxAC4AaQBzAG8A')))
    if (Test-Path ${/=\/===\/\_/\/=\_}) {
        ${/=\/\/\___/\_/\/=} = ${/=\/===\/\_/\/=\_}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBzAGkAbgBnACAAZQB4AGkAcwB0AGkAbgBnACAASQBTAE8AOgAgACQAewAvAD0AXAAvAFwALwBcAF8AXwBfAC8AXABfAC8AXAAvAD0AfQA=')))
    }
}
if (-not ${/=\/\/\___/\_/\/=}) {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBhAGwAbABpAG4AZwAgAGIAYQBjAGsAIAB0AG8AIABNAGUAZABpAGEAIABDAHIAZQBhAHQAaQBvAG4AIABUAG8AbwBsAC4ALgAuAA==')))
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    ${____/=\/\/===\___} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwATQBlAGQAaQBhAEMAcgBlAGEAdABpAG8AbgBUAG8AbwBsAF8AVwBpAG4AMQAxAC4AZQB4AGUA')))
    ${_/===\/==\/\__/\_} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGcAbwAuAG0AaQBjAHIAbwBzAG8AZgB0AC4AYwBvAG0ALwBmAHcAbABpAG4AawAvAD8AbABpAG4AawBpAGQAPQAyADEANQA2ADIAOQA1AA==')))
    if (-Not (Test-Path ${____/=\/\/===\___})) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAATQBlAGQAaQBhACAAQwByAGUAYQB0AGkAbwBuACAAVABvAG8AbAAuAC4ALgA=')))
        iwr -Uri ${_/===\/==\/\__/\_} -OutFile ${____/=\/\/===\___} -UseBasicParsing
    }
    ${_/===\/\/=\__/\/\} = saps -FilePath ${____/=\/\/===\___} -PassThru -Verb RunAs
    ${_/===\/\/=\__/\/\}.WaitForExit()
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBDAFQAIABjAGwAbwBzAGUAZAAuACAAUABsAGUAYQBzAGUAIABzAGUAbABlAGMAdAAgAEkAUwBPACAAZgBpAGwAZQAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAAuAA==')))
    ${__/=\/\_/==\_/==\} = New-Object System.Windows.Forms.OpenFileDialog
    ${__/=\/\_/==\_/==\}.Filter = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABGAGkAbABlAHMAIAAoACoALgBpAHMAbwApAHwAIAAqAC4AaQBzAG8A')))
    ${__/=\/\_/==\_/==\}.Title = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAIAB0AGgAZQAgAFcAaQBuAGQAbwB3AHMAIAAxADEAIABJAFMATwAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAA=')))
    if (${__/=\/\_/==\_/==\}.ShowDialog() -eq "OK") {
        ${/=\/\/\___/\_/\/=} = ${__/=\/\_/==\_/==\}.FileName
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAZQBkADoAIAAkAHsALwA9AFwALwBcAC8AXABfAF8AXwAvAFwAXwAvAFwALwA9AH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAASQBTAE8AIABzAGUAbABlAGMAdABlAGQALgAgAEUAeABpAHQAaQBuAGcALgA=')))
        exit
    }
}
if (-not (Test-Path ${/=\/\/\___/\_/\/=})) {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHUAbABkACAAbgBvAHQAIABmAGkAbgBkACAAbwByACAAZABvAHcAbgBsAG8AYQBkACAASQBTAE8ALgAgAEUAeABpAHQAaQBuAGcALgA=')))
    exit
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBvAHUAbgB0AGkAbgBnACAASQBTAE8ALgAuAC4A')))
${__/=\/==\/==\/\/=} = Mount-DiskImage -ImagePath ${/=\/\/\___/\_/\/=} -PassThru
${_/\_/\/\/\/\/=\__} = (${__/=\/==\/==\/\/=} | Get-Volume).DriveLetter + ":"
${__/=\/=====\_/\/=} = Join-Path ${_/\_/\/\/\/\/=\__} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUA')))
if (Test-Path ${__/=\/=====\_/\/=}) {
    ${_/\/=\/==\/\/\___} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LwBhAHUAdABvACAAYwBsAGUAYQBuACAALwBkAHkAbgBhAG0AaQBjAHUAcABkAGEAdABlACAAZABpAHMAYQBiAGwAZQAgAC8AZQB1AGwAYQAgAGEAYwBjAGUAcAB0ACAALwB1AG4AaQBuAHMAdABhAGwAbAAgAGQAaQBzAGEAYgBsAGUA')))
        saps -FilePath ${__/=\/=====\_/\/=} -ArgumentList ${_/\/=\/==\/\/\___} -Verb RunAs
} else {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUAIABuAG8AdAAgAGYAbwB1AG4AZAAgAGkAbgAgAG0AbwB1AG4AdABlAGQAIABJAFMATwAhAA==')))
}