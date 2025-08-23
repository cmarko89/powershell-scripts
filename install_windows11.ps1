
Add-Type -AssemblyName System.Windows.Forms
function c37b0936a7be421eae0bd795e0735cdc {
    try {
        gcm systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}
function b216a1f03a364e59b1550e87ba0f9129 {
    param (
        [string]${ccff2ca5b43045ad8ef31437e8f61ee1},
        [string]${bec19e0487bc4ad68e6592af52f15ea8}
    )
    try {
        ${a28b9713684c4c5b9e061d1cc2f202d8} = New-Object System.Net.WebClient
        ${a28b9713684c4c5b9e061d1cc2f202d8}.DownloadProgressChanged += {
            Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Status ($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ewAwAH0AJQA='))) -f $_.ProgressPercentage) -PercentComplete $_.ProgressPercentage
        }
        ${a28b9713684c4c5b9e061d1cc2f202d8}.DownloadFileAsync(${ccff2ca5b43045ad8ef31437e8f61ee1}, ${bec19e0487bc4ad68e6592af52f15ea8})
        while (${a28b9713684c4c5b9e061d1cc2f202d8}.IsBusy) { sleep -Milliseconds 500 }
        Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Completed
        return $true
    } catch {
        return $false
    }
}
if (c37b0936a7be421eae0bd795e0735cdc) {
    ${72d09c5507a14ddc9865caa3af3068d4} = New-Object System.Windows.Forms.Form
    ${72d09c5507a14ddc9865caa3af3068d4}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VwBpAG4AZABvAHcAcwAgAFIAZQBzAGUAdAAgAE8AcAB0AGkAbwBuAHMA')))
    ${72d09c5507a14ddc9865caa3af3068d4}.Size = New-Object Drawing.Size(350,150)
    ${72d09c5507a14ddc9865caa3af3068d4}.StartPosition = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBlAG4AdABlAHIAUwBjAHIAZQBlAG4A')))
    ${a4d22b4d7afe4846a116b1be94db587a} = New-Object System.Windows.Forms.Label
    ${a4d22b4d7afe4846a116b1be94db587a}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAG8AbwBzAGUAIABoAG8AdwAgAHQAbwAgAHIAZQBmAHIAZQBzAGgAIAB0AGgAaQBzACAAUABDADoA')))
    ${a4d22b4d7afe4846a116b1be94db587a}.AutoSize = $true
    ${a4d22b4d7afe4846a116b1be94db587a}.Location = New-Object Drawing.Point(10,20)
    ${72d09c5507a14ddc9865caa3af3068d4}.Controls.Add(${a4d22b4d7afe4846a116b1be94db587a})
    ${27a72eed49e441f49ffd42ddcf044fd6} = New-Object System.Windows.Forms.Button
    ${27a72eed49e441f49ffd42ddcf044fd6}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UQB1AGkAYwBrACAAUgBlAHMAZQB0AA==')))
    ${27a72eed49e441f49ffd42ddcf044fd6}.Location = New-Object Drawing.Point(30,60)
    ${27a72eed49e441f49ffd42ddcf044fd6}.Add_Click({
        ${72d09c5507a14ddc9865caa3af3068d4}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))
        ${72d09c5507a14ddc9865caa3af3068d4}.Close()
    })
    ${72d09c5507a14ddc9865caa3af3068d4}.Controls.Add(${27a72eed49e441f49ffd42ddcf044fd6})
    ${3b2810d7da9e476b8ae27d430e997b07} = New-Object System.Windows.Forms.Button
    ${3b2810d7da9e476b8ae27d430e997b07}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgB1AGwAbAAgAFIAZQBpAG4AcwB0AGEAbABsAA==')))
    ${3b2810d7da9e476b8ae27d430e997b07}.Location = New-Object Drawing.Point(150,60)
    ${3b2810d7da9e476b8ae27d430e997b07}.Add_Click({
        ${72d09c5507a14ddc9865caa3af3068d4}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))
        ${72d09c5507a14ddc9865caa3af3068d4}.Close()
    })
    ${72d09c5507a14ddc9865caa3af3068d4}.Controls.Add(${3b2810d7da9e476b8ae27d430e997b07})
    ${72d09c5507a14ddc9865caa3af3068d4}.ShowDialog() | Out-Null
    if (${72d09c5507a14ddc9865caa3af3068d4}.Tag -eq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgB1AG4AbgBpAG4AZwAgAFcAaQBuAGQAbwB3AHMAIABSAGUAcwBlAHQALgAuAC4A')))
        saps $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwB5AHMAdABlAG0AcgBlAHMAZQB0AC4AZQB4AGUA'))) -ArgumentList $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LQBmAGEAYwB0AG8AcgB5AHIAZQBzAGUAdAA=')))
        exit
    }
    elseif (${72d09c5507a14ddc9865caa3af3068d4}.Tag -ne $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))) {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAAYwBoAG8AaQBjAGUAIABtAGEAZABlAC4AIABFAHgAaQB0AGkAbgBnAC4A')))
        exit
    }
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAByAGUAcABhAHIAaQBuAGcAIABGAHUAbABsACAAUgBlAGkAbgBzAHQAYQBsAGwAIAB2AGkAYQAgAHMAZQB0AHUAcAAuAGUAeABlAC4ALgAuAA==')))
${690b51d66d5b49f7869241e7ec3be418} = "$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGQAcgBpAHYAZQAuAG0AYQBzAHMAZwByAGEAdgBlAC4AZABlAHYALwBlAG4ALQB1AHMAXwB3AGkAbgBkAG8AdwBzAF8AMQAxAF8AYwBvAG4AcwB1AG0AZQByAF8AZQBkAGkAdABpAG8AbgBzAF8AdgBlAHIAcwBpAG8AbgBfADIANABoADIAXwB1AHAAZABhAHQAZQBkAF8AYQB1AGcAXwAyADAAMgA1AF8AeAA2ADQAXwBkAHYAZABfADkAMgAzADYAZAA3ADkAYgAuAGkAcwBvAA==')))"   
${2da9a31195b44042a80a647ac81d9272}  = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFQARQBNAFAAXABXAGkAbgAxADEALgBpAHMAbwA=')))
${3f22af702a704c2486d23ca2c21ca96d} = $null
${4f7ee55525c64df0ac8a1a4fc4d6d214} = $false
if (${690b51d66d5b49f7869241e7ec3be418} -ne "") {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VAByAHkAaQBuAGcAIABkAGkAcgBlAGMAdAAgAEkAUwBPACAAZABvAHcAbgBsAG8AYQBkACAAZgByAG8AbQAgAE0AaQBjAHIAbwBzAG8AZgB0AC4ALgAuAA==')))
    ${4f7ee55525c64df0ac8a1a4fc4d6d214} = b216a1f03a364e59b1550e87ba0f9129 -ccff2ca5b43045ad8ef31437e8f61ee1 ${690b51d66d5b49f7869241e7ec3be418} -bec19e0487bc4ad68e6592af52f15ea8 ${2da9a31195b44042a80a647ac81d9272}
    if (${4f7ee55525c64df0ac8a1a4fc4d6d214} -and (Test-Path ${2da9a31195b44042a80a647ac81d9272})) {
        ${3f22af702a704c2486d23ca2c21ca96d} = ${2da9a31195b44042a80a647ac81d9272}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABkAG8AdwBuAGwAbwBhAGQAZQBkACAAcwB1AGMAYwBlAHMAcwBmAHUAbABsAHkAIAB0AG8AIAAkAHsAMwBmADIAMgBhAGYANwAwADIAYQA3ADAANABjADIANAA4ADYAZAAyADMAYwBhADIAYwAyADEAYwBhADkANgBkAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABpAHIAZQBjAHQAIABJAFMATwAgAGQAbwB3AG4AbABvAGEAZAAgAGYAYQBpAGwAZQBkACAAKABsAGkAbgBrACAAbQBhAHkAIABoAGEAdgBlACAAZQB4AHAAaQByAGUAZAApAC4A')))
    }
}
if (-not ${3f22af702a704c2486d23ca2c21ca96d}) {
    ${eb9e2cd11c32450d909625032108aa66} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwAVwBpAG4AMQAxAC4AaQBzAG8A')))
    if (Test-Path ${eb9e2cd11c32450d909625032108aa66}) {
        ${3f22af702a704c2486d23ca2c21ca96d} = ${eb9e2cd11c32450d909625032108aa66}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBzAGkAbgBnACAAZQB4AGkAcwB0AGkAbgBnACAASQBTAE8AOgAgACQAewAzAGYAMgAyAGEAZgA3ADAAMgBhADcAMAA0AGMAMgA0ADgANgBkADIAMwBjAGEAMgBjADIAMQBjAGEAOQA2AGQAfQA=')))
    }
}
if (-not ${3f22af702a704c2486d23ca2c21ca96d}) {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBhAGwAbABpAG4AZwAgAGIAYQBjAGsAIAB0AG8AIABNAGUAZABpAGEAIABDAHIAZQBhAHQAaQBvAG4AIABUAG8AbwBsAC4ALgAuAA==')))
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    ${40a500a6667046ae82c728c9b1dd3717} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwATQBlAGQAaQBhAEMAcgBlAGEAdABpAG8AbgBUAG8AbwBsAF8AVwBpAG4AMQAxAC4AZQB4AGUA')))
    ${5220323c8783407da2d735d7981b16e6} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGcAbwAuAG0AaQBjAHIAbwBzAG8AZgB0AC4AYwBvAG0ALwBmAHcAbABpAG4AawAvAD8AbABpAG4AawBpAGQAPQAyADEANQA2ADIAOQA1AA==')))
    if (-Not (Test-Path ${40a500a6667046ae82c728c9b1dd3717})) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAATQBlAGQAaQBhACAAQwByAGUAYQB0AGkAbwBuACAAVABvAG8AbAAuAC4ALgA=')))
        iwr -Uri ${5220323c8783407da2d735d7981b16e6} -OutFile ${40a500a6667046ae82c728c9b1dd3717} -UseBasicParsing
    }
    ${9dcc82afc1f74a56a19a32688f32f024} = saps -FilePath ${40a500a6667046ae82c728c9b1dd3717} -PassThru -Verb RunAs
    ${9dcc82afc1f74a56a19a32688f32f024}.WaitForExit()
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBDAFQAIABjAGwAbwBzAGUAZAAuACAAUABsAGUAYQBzAGUAIABzAGUAbABlAGMAdAAgAEkAUwBPACAAZgBpAGwAZQAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAAuAA==')))
    ${0028b4aeed9747a6b480ebf7ab641a2e} = New-Object System.Windows.Forms.OpenFileDialog
    ${0028b4aeed9747a6b480ebf7ab641a2e}.Filter = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABGAGkAbABlAHMAIAAoACoALgBpAHMAbwApAHwAIAAqAC4AaQBzAG8A')))
    ${0028b4aeed9747a6b480ebf7ab641a2e}.Title = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAIAB0AGgAZQAgAFcAaQBuAGQAbwB3AHMAIAAxADEAIABJAFMATwAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAA=')))
    if (${0028b4aeed9747a6b480ebf7ab641a2e}.ShowDialog() -eq "OK") {
        ${3f22af702a704c2486d23ca2c21ca96d} = ${0028b4aeed9747a6b480ebf7ab641a2e}.FileName
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAZQBkADoAIAAkAHsAMwBmADIAMgBhAGYANwAwADIAYQA3ADAANABjADIANAA4ADYAZAAyADMAYwBhADIAYwAyADEAYwBhADkANgBkAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAASQBTAE8AIABzAGUAbABlAGMAdABlAGQALgAgAEUAeABpAHQAaQBuAGcALgA=')))
        exit
    }
}
if (-not (Test-Path ${3f22af702a704c2486d23ca2c21ca96d})) {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHUAbABkACAAbgBvAHQAIABmAGkAbgBkACAAbwByACAAZABvAHcAbgBsAG8AYQBkACAASQBTAE8ALgAgAEUAeABpAHQAaQBuAGcALgA=')))
    exit
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBvAHUAbgB0AGkAbgBnACAASQBTAE8ALgAuAC4A')))
${5ea5a9172e0d4935acfcaeb33cc14180} = Mount-DiskImage -ImagePath ${3f22af702a704c2486d23ca2c21ca96d} -PassThru
${d0d6104334154868bb44a065a9e868a9} = (${5ea5a9172e0d4935acfcaeb33cc14180} | Get-Volume).DriveLetter + ":"
${2ab4b686d0ff438ea2d59b033c45f651} = Join-Path ${d0d6104334154868bb44a065a9e868a9} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUA')))
if (Test-Path ${2ab4b686d0ff438ea2d59b033c45f651}) {
    ${52d3f0b9c1954b6f838425631fdc8c24} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LwBhAHUAdABvACAAYwBsAGUAYQBuACAALwBkAHkAbgBhAG0AaQBjAHUAcABkAGEAdABlACAAZABpAHMAYQBiAGwAZQAgAC8AZQB1AGwAYQAgAGEAYwBjAGUAcAB0ACAALwB1AG4AaQBuAHMAdABhAGwAbAAgAGQAaQBzAGEAYgBsAGUA')))
    ${7545f184f1af46ed93fae59168a1d014} = [System.Windows.Forms.MessageBox]::Show(
        $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQBiAG8AdQB0ACAAdABvACAAbABhAHUAbgBjAGgAIABXAGkAbgBkAG8AdwBzACAAUwBlAHQAdQBwACAAZgBvAHIAIABDAEwARQBBAE4AIABJAE4AUwBUAEEATABMACAAKAB0AGgAaQBzACAAdwBpAGwAbAAgAHIAZQBtAG8AdgBlACAAYQBwAHAAcwAgAGEAbgBkACAAZgBpAGwAZQBzACkALgAgAEMAbwBuAHQAaQBuAHUAZQA/AA=='))),
        $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAG4AZgBpAHIAbQAgAEMAbABlAGEAbgAgAEkAbgBzAHQAYQBsAGwA'))),
        [System.Windows.Forms.MessageBoxButtons]::YesNo,
        [System.Windows.Forms.MessageBoxIcon]::Warning
    )
    if (${7545f184f1af46ed93fae59168a1d014} -eq [System.Windows.Forms.DialogResult]::Yes) {
        saps -FilePath ${2ab4b686d0ff438ea2d59b033c45f651} -ArgumentList ${52d3f0b9c1954b6f838425631fdc8c24} -Verb RunAs
    } else {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBsAGUAYQBuACAAaQBuAHMAdABhAGwAbAAgAGMAYQBuAGMAZQBsAGwAZQBkACAAYgB5ACAAdQBzAGUAcgAuAA==')))
    }
} else {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUAIABuAG8AdAAgAGYAbwB1AG4AZAAgAGkAbgAgAG0AbwB1AG4AdABlAGQAIABJAFMATwAhAA==')))
}