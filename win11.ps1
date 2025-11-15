
Add-Type -AssemblyName System.Windows.Forms
function ___/\/\__/\/==\__/ {
    try {
        gcm systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}
function ____/\_/\/==\_/\/= {
    param(
        [Parameter(Mandatory = $true)][string]${__/===\_/\__/=\/\_},
        [Parameter(Mandatory = $true)][string]${____/=\/\/\_____/\}
    )
    try {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        ${/=====\/\/=\/\/=\}  = [System.Net.HttpWebRequest]::Create(${__/===\_/\__/=\/\_})
        ${_/\_/===\/===\___} = ${/=====\/\/=\/\/=\}.GetResponse()
        ${/=\/=\_/\/=\/\___} = ${_/\_/===\/===\___}.ContentLength
        ${/=\_/\/\___/=\___}   = ${_/\_/===\/===\___}.GetResponseStream()
        ${/\____/\__/\_/\_/} = [System.IO.FileMode]::Create 
        ${/==\/\/====\/=\__}     = New-Object System.IO.FileStream(${____/=\/\/\_____/\}, ${/\____/\__/\_/\_/}, [System.IO.FileAccess]::Write)
        ${/==\/==\_/\/\_/\/} = New-Object byte[] 8192
        ${__/====\/=\/\__/=} = 0
        ${__/\/==\_/==\/===} = -1
        while ((${_/\/=\/=\/===\___} = ${/=\_/\/\___/=\___}.Read(${/==\/==\_/\/\_/\/}, 0, ${/==\/==\_/\/\_/\/}.Length)) -gt 0) {
            ${/==\/\/====\/=\__}.Write(${/==\/==\_/\/\_/\/}, 0, ${_/\/=\/=\/===\___})
            ${__/====\/=\/\__/=} += ${_/\/=\/=\/===\___}
            if (${/=\/=\_/\/=\/\___} -gt 0) {
                ${/===\/\/=\_______} = [math]::Round((${__/====\/=\/\__/=} / ${/=\/=\_/\/=\/\___}) * 100, 2)
                if (${/===\/\/=\_______} -ne ${__/\/==\_/==\/===}) {
                    Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Status $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JAB7AC8APQA9AD0AXAAvAFwALwA9AFwAXwBfAF8AXwBfAF8AXwB9ACUAIABjAG8AbQBwAGwAZQB0AGUA'))) -PercentComplete ${/===\/\/=\_______}
                    ${__/\/==\_/==\/===} = ${/===\/\/=\_______}
                }
            }
        }
        ${/==\/\/====\/=\__}.Close()
        ${/=\_/\/\___/=\___}.Close()
        ${_/\_/===\/===\___}.Close()
        Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Completed
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkACAAYwBvAG0AcABsAGUAdABlAGQAIABzAHUAYwBjAGUAcwBzAGYAdQBsAGwAeQA6ACAAJAB7AF8AXwBfAF8ALwA9AFwALwBcAC8AXABfAF8AXwBfAF8ALwBcAH0A')))
        return $true
    }
    catch {
        Write-Warning $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkACAAZgBhAGkAbABlAGQAOgAgACQAXwA=')))
        return $false
    }
}
if (___/\/\__/\/==\__/) {
    ${_/=\_/=======\__/} = New-Object System.Windows.Forms.Form
    ${_/=\_/=======\__/}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VwBpAG4AZABvAHcAcwAgAFIAZQBzAGUAdAAgAE8AcAB0AGkAbwBuAHMA')))
    ${_/=\_/=======\__/}.Size = New-Object Drawing.Size(350,150)
    ${_/=\_/=======\__/}.StartPosition = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBlAG4AdABlAHIAUwBjAHIAZQBlAG4A')))
    ${_/\_/====\/==\/\/} = New-Object System.Windows.Forms.Label
    ${_/\_/====\/==\/\/}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAG8AbwBzAGUAIABoAG8AdwAgAHQAbwAgAHIAZQBmAHIAZQBzAGgAIAB0AGgAaQBzACAAUABDADoA')))
    ${_/\_/====\/==\/\/}.AutoSize = $true
    ${_/\_/====\/==\/\/}.Location = New-Object Drawing.Point(10,20)
    ${_/=\_/=======\__/}.Controls.Add(${_/\_/====\/==\/\/})
    ${__/=\_/\____/=\__} = New-Object System.Windows.Forms.Button
    ${__/=\_/\____/=\__}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UQB1AGkAYwBrACAAUgBlAHMAZQB0AA==')))
    ${__/=\_/\____/=\__}.Location = New-Object Drawing.Point(30,60)
    ${__/=\_/\____/=\__}.Add_Click({
        ${_/=\_/=======\__/}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))
        ${_/=\_/=======\__/}.Close()
    })
    ${_/=\_/=======\__/}.Controls.Add(${__/=\_/\____/=\__})
    ${____/\___/======\} = New-Object System.Windows.Forms.Button
    ${____/\___/======\}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgB1AGwAbAAgAFIAZQBpAG4AcwB0AGEAbABsAA==')))
    ${____/\___/======\}.Location = New-Object Drawing.Point(150,60)
    ${____/\___/======\}.Add_Click({
        ${_/=\_/=======\__/}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))
        ${_/=\_/=======\__/}.Close()
    })
    ${_/=\_/=======\__/}.Controls.Add(${____/\___/======\})
    ${_/=\_/=======\__/}.ShowDialog() | Out-Null
    if (${_/=\_/=======\__/}.Tag -eq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgB1AG4AbgBpAG4AZwAgAFcAaQBuAGQAbwB3AHMAIABSAGUAcwBlAHQALgAuAC4A')))
        saps $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwB5AHMAdABlAG0AcgBlAHMAZQB0AC4AZQB4AGUA'))) -ArgumentList $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LQBmAGEAYwB0AG8AcgB5AHIAZQBzAGUAdAA=')))
        exit
    }
    elseif (${_/=\_/=======\__/}.Tag -ne $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))) {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAAYwBoAG8AaQBjAGUAIABtAGEAZABlAC4AIABFAHgAaQB0AGkAbgBnAC4A')))
        exit
    }
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAByAGUAcABhAHIAaQBuAGcAIABGAHUAbABsACAAUgBlAGkAbgBzAHQAYQBsAGwAIAB2AGkAYQAgAHMAZQB0AHUAcAAuAGUAeABlAC4ALgAuAA==')))
${__/=\/=====\__/\_} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAHMAbwBmAHQAdwBhAHIAZQAtAHMAdABhAHQAaQBjAC4AZABvAHcAbgBsAG8AYQBkAC4AcAByAHMAcwAuAG0AaQBjAHIAbwBzAG8AZgB0AC4AYwBvAG0ALwBkAGIAYQB6AHUAcgBlAC8AOAA4ADgAOQA2ADkAZAA1AC0AZgAzADQAZwAtADQAZQAwADMALQBhAGMAOQBkAC0AMQBmADkANwA4ADYAYwA2ADYANwA0ADkALwAyADYAMgAwADAALgA2ADUAOAA0AC4AMgA1ADAAOQAxADUALQAxADkAMAA1AC4AMgA1AGgAMgBfAGcAZQBfAHIAZQBsAGUAYQBzAGUAXwBzAHYAYwBfAHIAZQBmAHIAZQBzAGgAXwBDAEwASQBFAE4AVABfAEMATwBOAFMAVQBNAEUAUgBfAHgANgA0AEYAUgBFAF8AZQBuAC0AdQBzAC4AaQBzAG8A')))   
${_/\__/==\/=\_/\/\}  = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFQARQBNAFAAXABXAGkAbgAxADEALgBpAHMAbwA=')))
${__/=\/\/\_/\/\/==} = $null
${_/\/\/\/\/\/=\/\/} = $false
if (${__/=\/=====\__/\_} -ne "") {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VAByAHkAaQBuAGcAIABkAGkAcgBlAGMAdAAgAEkAUwBPACAAZABvAHcAbgBsAG8AYQBkACAAZgByAG8AbQAgAE0AaQBjAHIAbwBzAG8AZgB0AC4ALgAuAA==')))
    ${_/\/\/\/\/\/=\/\/} = ____/\_/\/==\_/\/= -__/===\_/\__/=\/\_ ${__/=\/=====\__/\_} -____/=\/\/\_____/\ ${_/\__/==\/=\_/\/\}
    if (${_/\/\/\/\/\/=\/\/} -and (Test-Path ${_/\__/==\/=\_/\/\})) {
        ${__/=\/\/\_/\/\/==} = ${_/\__/==\/=\_/\/\}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABkAG8AdwBuAGwAbwBhAGQAZQBkACAAcwB1AGMAYwBlAHMAcwBmAHUAbABsAHkAIAB0AG8AIAAkAHsAXwBfAC8APQBcAC8AXAAvAFwAXwAvAFwALwBcAC8APQA9AH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABpAHIAZQBjAHQAIABJAFMATwAgAGQAbwB3AG4AbABvAGEAZAAgAGYAYQBpAGwAZQBkACAAKABsAGkAbgBrACAAbQBhAHkAIABoAGEAdgBlACAAZQB4AHAAaQByAGUAZAApAC4A')))
    }
}
if (-not ${__/=\/\/\_/\/\/==}) {
    ${_/\/\_/\_/\_/===\} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwAVwBpAG4AMQAxAC4AaQBzAG8A')))
    if (Test-Path ${_/\/\_/\_/\_/===\}) {
        ${__/=\/\/\_/\/\/==} = ${_/\/\_/\_/\_/===\}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBzAGkAbgBnACAAZQB4AGkAcwB0AGkAbgBnACAASQBTAE8AOgAgACQAewBfAF8ALwA9AFwALwBcAC8AXABfAC8AXAAvAFwALwA9AD0AfQA=')))
    }
}
if (-not ${__/=\/\/\_/\/\/==}) {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBhAGwAbABpAG4AZwAgAGIAYQBjAGsAIAB0AG8AIABNAGUAZABpAGEAIABDAHIAZQBhAHQAaQBvAG4AIABUAG8AbwBsAC4ALgAuAA==')))
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    ${_____/\___/===\__} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwATQBlAGQAaQBhAEMAcgBlAGEAdABpAG8AbgBUAG8AbwBsAF8AVwBpAG4AMQAxAC4AZQB4AGUA')))
    ${/=\_____/\___/\/=} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGcAbwAuAG0AaQBjAHIAbwBzAG8AZgB0AC4AYwBvAG0ALwBmAHcAbABpAG4AawAvAD8AbABpAG4AawBpAGQAPQAyADEANQA2ADIAOQA1AA==')))
    if (-Not (Test-Path ${_____/\___/===\__})) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAATQBlAGQAaQBhACAAQwByAGUAYQB0AGkAbwBuACAAVABvAG8AbAAuAC4ALgA=')))
        iwr -Uri ${/=\_____/\___/\/=} -OutFile ${_____/\___/===\__} -UseBasicParsing
    }
    ${/=\_/====\/==\__/} = saps -FilePath ${_____/\___/===\__} -PassThru -Verb RunAs
    ${/=\_/====\/==\__/}.WaitForExit()
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBDAFQAIABjAGwAbwBzAGUAZAAuACAAUABsAGUAYQBzAGUAIABzAGUAbABlAGMAdAAgAEkAUwBPACAAZgBpAGwAZQAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAAuAA==')))
    ${_/===\_/=\/===\/\} = New-Object System.Windows.Forms.OpenFileDialog
    ${_/===\_/=\/===\/\}.Filter = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABGAGkAbABlAHMAIAAoACoALgBpAHMAbwApAHwAIAAqAC4AaQBzAG8A')))
    ${_/===\_/=\/===\/\}.Title = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAIAB0AGgAZQAgAFcAaQBuAGQAbwB3AHMAIAAxADEAIABJAFMATwAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAA=')))
    if (${_/===\_/=\/===\/\}.ShowDialog() -eq "OK") {
        ${__/=\/\/\_/\/\/==} = ${_/===\_/=\/===\/\}.FileName
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAZQBkADoAIAAkAHsAXwBfAC8APQBcAC8AXAAvAFwAXwAvAFwALwBcAC8APQA9AH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAASQBTAE8AIABzAGUAbABlAGMAdABlAGQALgAgAEUAeABpAHQAaQBuAGcALgA=')))
        exit
    }
}
if (-not (Test-Path ${__/=\/\/\_/\/\/==})) {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHUAbABkACAAbgBvAHQAIABmAGkAbgBkACAAbwByACAAZABvAHcAbgBsAG8AYQBkACAASQBTAE8ALgAgAEUAeABpAHQAaQBuAGcALgA=')))
    exit
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBvAHUAbgB0AGkAbgBnACAASQBTAE8ALgAuAC4A')))
${/==\__/\____/\_/=} = Mount-DiskImage -ImagePath ${__/=\/\/\_/\/\/==} -PassThru
${/=\/\/=\______/==} = (${/==\__/\____/\_/=} | Get-Volume).DriveLetter + ":"
${_/=\/\/\____/\/=\} = Join-Path ${/=\/\/=\______/==} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUA')))
if (Test-Path ${_/=\/\/\____/\/=\}) {
    ${___/\__/\_/==\/\_} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LwBhAHUAdABvACAAYwBsAGUAYQBuACAALwBkAHkAbgBhAG0AaQBjAHUAcABkAGEAdABlACAAZABpAHMAYQBiAGwAZQAgAC8AZQB1AGwAYQAgAGEAYwBjAGUAcAB0ACAALwB1AG4AaQBuAHMAdABhAGwAbAAgAGQAaQBzAGEAYgBsAGUA')))
        saps -FilePath ${_/=\/\/\____/\/=\} -ArgumentList ${___/\__/\_/==\/\_} -Verb RunAs
} else {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUAIABuAG8AdAAgAGYAbwB1AG4AZAAgAGkAbgAgAG0AbwB1AG4AdABlAGQAIABJAFMATwAhAA==')))
}