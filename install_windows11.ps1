
Add-Type -AssemblyName System.Windows.Forms
function c6741704cb3d46f4a38591612a3191da {
    try {
        gcm systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}
function e8b8ee3e01194f4b9da960e3be24ea81 {
    param (
        [string]${ea855027e0fa4ab6849176d5ac971142},
        [string]${a5b3505d51eb4dc6975b52095561e2e8}
    )
    try {
        ${f3bdc0d2e0eb44c39411135d4e4104b3} = New-Object System.Net.WebClient
        ${f3bdc0d2e0eb44c39411135d4e4104b3}.DownloadProgressChanged += {
            Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Status ($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ewAwAH0AJQA='))) -f $_.ProgressPercentage) -PercentComplete $_.ProgressPercentage
        }
        ${f3bdc0d2e0eb44c39411135d4e4104b3}.DownloadFileAsync(${ea855027e0fa4ab6849176d5ac971142}, ${a5b3505d51eb4dc6975b52095561e2e8})
        while (${f3bdc0d2e0eb44c39411135d4e4104b3}.IsBusy) { sleep -Milliseconds 500 }
        Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Completed
        return $true
    } catch {
        return $false
    }
}
if (c6741704cb3d46f4a38591612a3191da) {
    ${0e59f6a7b6ba449d88faf86560b64ded} = New-Object System.Windows.Forms.Form
    ${0e59f6a7b6ba449d88faf86560b64ded}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VwBpAG4AZABvAHcAcwAgAFIAZQBzAGUAdAAgAE8AcAB0AGkAbwBuAHMA')))
    ${0e59f6a7b6ba449d88faf86560b64ded}.Size = New-Object Drawing.Size(350,150)
    ${0e59f6a7b6ba449d88faf86560b64ded}.StartPosition = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBlAG4AdABlAHIAUwBjAHIAZQBlAG4A')))
    ${c261b4341675475fbf74d96ee5a065b1} = New-Object System.Windows.Forms.Label
    ${c261b4341675475fbf74d96ee5a065b1}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAG8AbwBzAGUAIABoAG8AdwAgAHQAbwAgAHIAZQBmAHIAZQBzAGgAIAB0AGgAaQBzACAAUABDADoA')))
    ${c261b4341675475fbf74d96ee5a065b1}.AutoSize = $true
    ${c261b4341675475fbf74d96ee5a065b1}.Location = New-Object Drawing.Point(10,20)
    ${0e59f6a7b6ba449d88faf86560b64ded}.Controls.Add(${c261b4341675475fbf74d96ee5a065b1})
    ${60fda917f98f4810bf1f503baaf9e264} = New-Object System.Windows.Forms.Button
    ${60fda917f98f4810bf1f503baaf9e264}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UQB1AGkAYwBrACAAUgBlAHMAZQB0AA==')))
    ${60fda917f98f4810bf1f503baaf9e264}.Location = New-Object Drawing.Point(30,60)
    ${60fda917f98f4810bf1f503baaf9e264}.Add_Click({
        ${0e59f6a7b6ba449d88faf86560b64ded}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))
        ${0e59f6a7b6ba449d88faf86560b64ded}.Close()
    })
    ${0e59f6a7b6ba449d88faf86560b64ded}.Controls.Add(${60fda917f98f4810bf1f503baaf9e264})
    ${d7fddbb9c7924c0e95a794e6926130b8} = New-Object System.Windows.Forms.Button
    ${d7fddbb9c7924c0e95a794e6926130b8}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgB1AGwAbAAgAFIAZQBpAG4AcwB0AGEAbABsAA==')))
    ${d7fddbb9c7924c0e95a794e6926130b8}.Location = New-Object Drawing.Point(150,60)
    ${d7fddbb9c7924c0e95a794e6926130b8}.Add_Click({
        ${0e59f6a7b6ba449d88faf86560b64ded}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))
        ${0e59f6a7b6ba449d88faf86560b64ded}.Close()
    })
    ${0e59f6a7b6ba449d88faf86560b64ded}.Controls.Add(${d7fddbb9c7924c0e95a794e6926130b8})
    ${0e59f6a7b6ba449d88faf86560b64ded}.ShowDialog() | Out-Null
    if (${0e59f6a7b6ba449d88faf86560b64ded}.Tag -eq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgB1AG4AbgBpAG4AZwAgAFcAaQBuAGQAbwB3AHMAIABSAGUAcwBlAHQALgAuAC4A')))
        saps $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwB5AHMAdABlAG0AcgBlAHMAZQB0AC4AZQB4AGUA'))) -ArgumentList $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LQBmAGEAYwB0AG8AcgB5AHIAZQBzAGUAdAA=')))
        exit
    }
    elseif (${0e59f6a7b6ba449d88faf86560b64ded}.Tag -ne $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))) {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAAYwBoAG8AaQBjAGUAIABtAGEAZABlAC4AIABFAHgAaQB0AGkAbgBnAC4A')))
        exit
    }
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAByAGUAcABhAHIAaQBuAGcAIABGAHUAbABsACAAUgBlAGkAbgBzAHQAYQBsAGwAIAB2AGkAYQAgAHMAZQB0AHUAcAAuAGUAeABlAC4ALgAuAA==')))
${b8b7ec6cd8f344ddaa66cc20b16ed3b8} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGQAcgBpAHYAZQAuAG0AYQBzAHMAZwByAGEAdgBlAC4AZABlAHYALwBlAG4ALQB1AHMAXwB3AGkAbgBkAG8AdwBzAF8AMQAxAF8AYwBvAG4AcwB1AG0AZQByAF8AZQBkAGkAdABpAG8AbgBzAF8AdgBlAHIAcwBpAG8AbgBfADIANABoADIAXwB1AHAAZABhAHQAZQBkAF8AYQB1AGcAXwAyADAAMgA1AF8AeAA2ADQAXwBkAHYAZABfADkAMgAzADYAZAA3ADkAYgAuAGkAcwBvAA==')))   
${22a4444fea444acf8dd32fa2e8c3ec16}  = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFQARQBNAFAAXABXAGkAbgAxADEALgBpAHMAbwA=')))
${5c867b72fc284247a114a97a8359a14d} = $null
${35235af9298a40aeada80c4cdb66e91a} = $false
if (${b8b7ec6cd8f344ddaa66cc20b16ed3b8} -ne "") {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VAByAHkAaQBuAGcAIABkAGkAcgBlAGMAdAAgAEkAUwBPACAAZABvAHcAbgBsAG8AYQBkACAAZgByAG8AbQAgAE0AaQBjAHIAbwBzAG8AZgB0AC4ALgAuAA==')))
    ${35235af9298a40aeada80c4cdb66e91a} = e8b8ee3e01194f4b9da960e3be24ea81 -ea855027e0fa4ab6849176d5ac971142 ${b8b7ec6cd8f344ddaa66cc20b16ed3b8} -a5b3505d51eb4dc6975b52095561e2e8 ${22a4444fea444acf8dd32fa2e8c3ec16}
    if (${35235af9298a40aeada80c4cdb66e91a} -and (Test-Path ${22a4444fea444acf8dd32fa2e8c3ec16})) {
        ${5c867b72fc284247a114a97a8359a14d} = ${22a4444fea444acf8dd32fa2e8c3ec16}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABkAG8AdwBuAGwAbwBhAGQAZQBkACAAcwB1AGMAYwBlAHMAcwBmAHUAbABsAHkAIAB0AG8AIAAkAHsANQBjADgANgA3AGIANwAyAGYAYwAyADgANAAyADQANwBhADEAMQA0AGEAOQA3AGEAOAAzADUAOQBhADEANABkAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABpAHIAZQBjAHQAIABJAFMATwAgAGQAbwB3AG4AbABvAGEAZAAgAGYAYQBpAGwAZQBkACAAKABsAGkAbgBrACAAbQBhAHkAIABoAGEAdgBlACAAZQB4AHAAaQByAGUAZAApAC4A')))
    }
}
if (-not ${5c867b72fc284247a114a97a8359a14d}) {
    ${0483c00ae4ed4102a1be10b4a200a6c3} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwAVwBpAG4AMQAxAC4AaQBzAG8A')))
    if (Test-Path ${0483c00ae4ed4102a1be10b4a200a6c3}) {
        ${5c867b72fc284247a114a97a8359a14d} = ${0483c00ae4ed4102a1be10b4a200a6c3}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBzAGkAbgBnACAAZQB4AGkAcwB0AGkAbgBnACAASQBTAE8AOgAgACQAewA1AGMAOAA2ADcAYgA3ADIAZgBjADIAOAA0ADIANAA3AGEAMQAxADQAYQA5ADcAYQA4ADMANQA5AGEAMQA0AGQAfQA=')))
    }
}
if (-not ${5c867b72fc284247a114a97a8359a14d}) {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBhAGwAbABpAG4AZwAgAGIAYQBjAGsAIAB0AG8AIABNAGUAZABpAGEAIABDAHIAZQBhAHQAaQBvAG4AIABUAG8AbwBsAC4ALgAuAA==')))
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    ${038135873e8a44e8a6c8181b2f1971a1} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwATQBlAGQAaQBhAEMAcgBlAGEAdABpAG8AbgBUAG8AbwBsAF8AVwBpAG4AMQAxAC4AZQB4AGUA')))
    ${d89036fb959f4234a1ddaddb2220d485} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGcAbwAuAG0AaQBjAHIAbwBzAG8AZgB0AC4AYwBvAG0ALwBmAHcAbABpAG4AawAvAD8AbABpAG4AawBpAGQAPQAyADEANQA2ADIAOQA1AA==')))
    if (-Not (Test-Path ${038135873e8a44e8a6c8181b2f1971a1})) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAATQBlAGQAaQBhACAAQwByAGUAYQB0AGkAbwBuACAAVABvAG8AbAAuAC4ALgA=')))
        iwr -Uri ${d89036fb959f4234a1ddaddb2220d485} -OutFile ${038135873e8a44e8a6c8181b2f1971a1} -UseBasicParsing
    }
    ${36cfd3b515df499da24aa46384a9eef6} = saps -FilePath ${038135873e8a44e8a6c8181b2f1971a1} -PassThru -Verb RunAs
    ${36cfd3b515df499da24aa46384a9eef6}.WaitForExit()
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBDAFQAIABjAGwAbwBzAGUAZAAuACAAUABsAGUAYQBzAGUAIABzAGUAbABlAGMAdAAgAEkAUwBPACAAZgBpAGwAZQAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAAuAA==')))
    ${c75e370ebb254240842b424b2f7e4833} = New-Object System.Windows.Forms.OpenFileDialog
    ${c75e370ebb254240842b424b2f7e4833}.Filter = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABGAGkAbABlAHMAIAAoACoALgBpAHMAbwApAHwAIAAqAC4AaQBzAG8A')))
    ${c75e370ebb254240842b424b2f7e4833}.Title = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAIAB0AGgAZQAgAFcAaQBuAGQAbwB3AHMAIAAxADEAIABJAFMATwAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAA=')))
    if (${c75e370ebb254240842b424b2f7e4833}.ShowDialog() -eq "OK") {
        ${5c867b72fc284247a114a97a8359a14d} = ${c75e370ebb254240842b424b2f7e4833}.FileName
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAZQBkADoAIAAkAHsANQBjADgANgA3AGIANwAyAGYAYwAyADgANAAyADQANwBhADEAMQA0AGEAOQA3AGEAOAAzADUAOQBhADEANABkAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAASQBTAE8AIABzAGUAbABlAGMAdABlAGQALgAgAEUAeABpAHQAaQBuAGcALgA=')))
        exit
    }
}
if (-not (Test-Path ${5c867b72fc284247a114a97a8359a14d})) {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHUAbABkACAAbgBvAHQAIABmAGkAbgBkACAAbwByACAAZABvAHcAbgBsAG8AYQBkACAASQBTAE8ALgAgAEUAeABpAHQAaQBuAGcALgA=')))
    exit
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBvAHUAbgB0AGkAbgBnACAASQBTAE8ALgAuAC4A')))
${ec00965bbb234c9895917a557b5daab5} = Mount-DiskImage -ImagePath ${5c867b72fc284247a114a97a8359a14d} -PassThru
${ad22c275b07b4f2b895421c564862b6f} = (${ec00965bbb234c9895917a557b5daab5} | Get-Volume).DriveLetter + ":"
${e03ef8e48db541daa2722168de0cf3f6} = Join-Path ${ad22c275b07b4f2b895421c564862b6f} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUA')))
if (Test-Path ${e03ef8e48db541daa2722168de0cf3f6}) {
    ${8a32c4f056d24cfa8cded78ac18c3a73} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LwBhAHUAdABvACAAYwBsAGUAYQBuACAALwBkAHkAbgBhAG0AaQBjAHUAcABkAGEAdABlACAAZABpAHMAYQBiAGwAZQAgAC8AZQB1AGwAYQAgAGEAYwBjAGUAcAB0ACAALwB1AG4AaQBuAHMAdABhAGwAbAAgAGQAaQBzAGEAYgBsAGUA')))
    ${f78bc4e038404e8ca0f2e4cd755cf388} = [System.Windows.Forms.MessageBox]::Show(
        $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQBiAG8AdQB0ACAAdABvACAAbABhAHUAbgBjAGgAIABXAGkAbgBkAG8AdwBzACAAUwBlAHQAdQBwACAAZgBvAHIAIABDAEwARQBBAE4AIABJAE4AUwBUAEEATABMACAAKAB0AGgAaQBzACAAdwBpAGwAbAAgAHIAZQBtAG8AdgBlACAAYQBwAHAAcwAgAGEAbgBkACAAZgBpAGwAZQBzACkALgAgAEMAbwBuAHQAaQBuAHUAZQA/AA=='))),
        $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAG4AZgBpAHIAbQAgAEMAbABlAGEAbgAgAEkAbgBzAHQAYQBsAGwA'))),
        [System.Windows.Forms.MessageBoxButtons]::YesNo,
        [System.Windows.Forms.MessageBoxIcon]::Warning
    )
    if (${f78bc4e038404e8ca0f2e4cd755cf388} -eq [System.Windows.Forms.DialogResult]::Yes) {
        saps -FilePath ${e03ef8e48db541daa2722168de0cf3f6} -ArgumentList ${8a32c4f056d24cfa8cded78ac18c3a73} -Verb RunAs
    } else {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBsAGUAYQBuACAAaQBuAHMAdABhAGwAbAAgAGMAYQBuAGMAZQBsAGwAZQBkACAAYgB5ACAAdQBzAGUAcgAuAA==')))
    }
} else {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUAIABuAG8AdAAgAGYAbwB1AG4AZAAgAGkAbgAgAG0AbwB1AG4AdABlAGQAIABJAFMATwAhAA==')))
}