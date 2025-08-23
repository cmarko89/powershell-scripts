
Add-Type -AssemblyName System.Windows.Forms
function c81aa069ade94d84ad77deff55645b07 {
    try {
        gcm systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}
function bab57ca1bd0e4bcea274944f5f0e2b8d {
    param (
        [string]${b1982c87d67d44fe83e2c808e326376a},
        [string]${d92aa901e3c6496bb95b1b1e0d0e6fa7}
    )
    try {
        ${62e45878ddac4907a2bb0aadc6b4005d} = New-Object System.Net.WebClient
        ${62e45878ddac4907a2bb0aadc6b4005d}.DownloadProgressChanged += {
            Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Status ($([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('ewAwAH0AJQA='))) -f $_.ProgressPercentage) -PercentComplete $_.ProgressPercentage
        }
        ${62e45878ddac4907a2bb0aadc6b4005d}.DownloadFileAsync(${b1982c87d67d44fe83e2c808e326376a}, ${d92aa901e3c6496bb95b1b1e0d0e6fa7})
        while (${62e45878ddac4907a2bb0aadc6b4005d}.IsBusy) { sleep -Milliseconds 500 }
        Write-Progress -Activity $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAASQBTAE8A'))) -Completed
        return $true
    } catch {
        return $false
    }
}
if (c81aa069ade94d84ad77deff55645b07) {
    ${851cbfb9557642db8af4d3e724f77260} = New-Object System.Windows.Forms.Form
    ${851cbfb9557642db8af4d3e724f77260}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VwBpAG4AZABvAHcAcwAgAFIAZQBzAGUAdAAgAE8AcAB0AGkAbwBuAHMA')))
    ${851cbfb9557642db8af4d3e724f77260}.Size = New-Object Drawing.Size(350,150)
    ${851cbfb9557642db8af4d3e724f77260}.StartPosition = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBlAG4AdABlAHIAUwBjAHIAZQBlAG4A')))
    ${f4017dddf0414f0c880aaba0a8286050} = New-Object System.Windows.Forms.Label
    ${f4017dddf0414f0c880aaba0a8286050}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBoAG8AbwBzAGUAIABoAG8AdwAgAHQAbwAgAHIAZQBmAHIAZQBzAGgAIAB0AGgAaQBzACAAUABDADoA')))
    ${f4017dddf0414f0c880aaba0a8286050}.AutoSize = $true
    ${f4017dddf0414f0c880aaba0a8286050}.Location = New-Object Drawing.Point(10,20)
    ${851cbfb9557642db8af4d3e724f77260}.Controls.Add(${f4017dddf0414f0c880aaba0a8286050})
    ${52331988fe57492896bd8ef7291acea3} = New-Object System.Windows.Forms.Button
    ${52331988fe57492896bd8ef7291acea3}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UQB1AGkAYwBrACAAUgBlAHMAZQB0AA==')))
    ${52331988fe57492896bd8ef7291acea3}.Location = New-Object Drawing.Point(30,60)
    ${52331988fe57492896bd8ef7291acea3}.Add_Click({
        ${851cbfb9557642db8af4d3e724f77260}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))
        ${851cbfb9557642db8af4d3e724f77260}.Close()
    })
    ${851cbfb9557642db8af4d3e724f77260}.Controls.Add(${52331988fe57492896bd8ef7291acea3})
    ${21bf6abda3f7487a9465cbaedf8d16f1} = New-Object System.Windows.Forms.Button
    ${21bf6abda3f7487a9465cbaedf8d16f1}.Text = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgB1AGwAbAAgAFIAZQBpAG4AcwB0AGEAbABsAA==')))
    ${21bf6abda3f7487a9465cbaedf8d16f1}.Location = New-Object Drawing.Point(150,60)
    ${21bf6abda3f7487a9465cbaedf8d16f1}.Add_Click({
        ${851cbfb9557642db8af4d3e724f77260}.Tag = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))
        ${851cbfb9557642db8af4d3e724f77260}.Close()
    })
    ${851cbfb9557642db8af4d3e724f77260}.Controls.Add(${21bf6abda3f7487a9465cbaedf8d16f1})
    ${851cbfb9557642db8af4d3e724f77260}.ShowDialog() | Out-Null
    if (${851cbfb9557642db8af4d3e724f77260}.Tag -eq $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAHMAZQB0AA==')))) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UgB1AG4AbgBpAG4AZwAgAFcAaQBuAGQAbwB3AHMAIABSAGUAcwBlAHQALgAuAC4A')))
        saps $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwB5AHMAdABlAG0AcgBlAHMAZQB0AC4AZQB4AGUA'))) -ArgumentList $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LQBmAGEAYwB0AG8AcgB5AHIAZQBzAGUAdAA=')))
        exit
    }
    elseif (${851cbfb9557642db8af4d3e724f77260}.Tag -ne $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cgBlAGkAbgBzAHQAYQBsAGwA')))) {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAAYwBoAG8AaQBjAGUAIABtAGEAZABlAC4AIABFAHgAaQB0AGkAbgBnAC4A')))
        exit
    }
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UAByAGUAcABhAHIAaQBuAGcAIABGAHUAbABsACAAUgBlAGkAbgBzAHQAYQBsAGwAIAB2AGkAYQAgAHMAZQB0AHUAcAAuAGUAeABlAC4ALgAuAA==')))
${c84b0082b28c4a95bcfe7047cfb08b41} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGEAcgBjAGgAaQB2AGUALgBvAHIAZwAvAGQAbwB3AG4AbABvAGEAZAAvAHcAaQBuAGQAbwB3AHMALQAxADEALQAyADQAaAAyAC0AaQBzAG8AXwAyADAAMgA1ADAAMQAvAFcAaQBuADEAMQBfADIANABIADIAXwBFAG4AZwBsAGkAcwBoAF8AeAA2ADQALgBpAHMAbwA=')))   
${839c1df8014c4ebebd69b8b52d5e0d73}  = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFQARQBNAFAAXABXAGkAbgAxADEALgBpAHMAbwA=')))
${d4a30f984d8d4a84b5b3557d324ed310} = $null
${2baa6a995b5b4943bab9a2eb8e3e49a2} = $false
if (${c84b0082b28c4a95bcfe7047cfb08b41} -ne "") {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VAByAHkAaQBuAGcAIABkAGkAcgBlAGMAdAAgAEkAUwBPACAAZABvAHcAbgBsAG8AYQBkACAAZgByAG8AbQAgAE0AaQBjAHIAbwBzAG8AZgB0AC4ALgAuAA==')))
    ${2baa6a995b5b4943bab9a2eb8e3e49a2} = bab57ca1bd0e4bcea274944f5f0e2b8d -b1982c87d67d44fe83e2c808e326376a ${c84b0082b28c4a95bcfe7047cfb08b41} -d92aa901e3c6496bb95b1b1e0d0e6fa7 ${839c1df8014c4ebebd69b8b52d5e0d73}
    if (${2baa6a995b5b4943bab9a2eb8e3e49a2} -and (Test-Path ${839c1df8014c4ebebd69b8b52d5e0d73})) {
        ${d4a30f984d8d4a84b5b3557d324ed310} = ${839c1df8014c4ebebd69b8b52d5e0d73}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABkAG8AdwBuAGwAbwBhAGQAZQBkACAAcwB1AGMAYwBlAHMAcwBmAHUAbABsAHkAIAB0AG8AIAAkAHsAZAA0AGEAMwAwAGYAOQA4ADQAZAA4AGQANABhADgANABiADUAYgAzADUANQA3AGQAMwAyADQAZQBkADMAMQAwAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABpAHIAZQBjAHQAIABJAFMATwAgAGQAbwB3AG4AbABvAGEAZAAgAGYAYQBpAGwAZQBkACAAKABsAGkAbgBrACAAbQBhAHkAIABoAGEAdgBlACAAZQB4AHAAaQByAGUAZAApAC4A')))
    }
}
if (-not ${d4a30f984d8d4a84b5b3557d324ed310}) {
    ${817f5c7ccc8c4af6b7bffc2ea304a2ec} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwAVwBpAG4AMQAxAC4AaQBzAG8A')))
    if (Test-Path ${817f5c7ccc8c4af6b7bffc2ea304a2ec}) {
        ${d4a30f984d8d4a84b5b3557d324ed310} = ${817f5c7ccc8c4af6b7bffc2ea304a2ec}
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('VQBzAGkAbgBnACAAZQB4AGkAcwB0AGkAbgBnACAASQBTAE8AOgAgACQAewBkADQAYQAzADAAZgA5ADgANABkADgAZAA0AGEAOAA0AGIANQBiADMANQA1ADcAZAAzADIANABlAGQAMwAxADAAfQA=')))
    }
}
if (-not ${d4a30f984d8d4a84b5b3557d324ed310}) {
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RgBhAGwAbABpAG4AZwAgAGIAYQBjAGsAIAB0AG8AIABNAGUAZABpAGEAIABDAHIAZQBhAHQAaQBvAG4AIABUAG8AbwBsAC4ALgAuAA==')))
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    ${6b43d9ec13874f43b5cade01c7295166} = $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('JABlAG4AdgA6AFUAUwBFAFIAUABSAE8ARgBJAEwARQBcAEQAbwB3AG4AbABvAGEAZABzAFwATQBlAGQAaQBhAEMAcgBlAGEAdABpAG8AbgBUAG8AbwBsAF8AVwBpAG4AMQAxAC4AZQB4AGUA')))
    ${22a22b1f55b84b04a6b05ec5468d9342} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGcAbwAuAG0AaQBjAHIAbwBzAG8AZgB0AC4AYwBvAG0ALwBmAHcAbABpAG4AawAvAD8AbABpAG4AawBpAGQAPQAyADEANQA2ADIAOQA1AA==')))
    if (-Not (Test-Path ${6b43d9ec13874f43b5cade01c7295166})) {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('RABvAHcAbgBsAG8AYQBkAGkAbgBnACAATQBlAGQAaQBhACAAQwByAGUAYQB0AGkAbwBuACAAVABvAG8AbAAuAC4ALgA=')))
        iwr -Uri ${22a22b1f55b84b04a6b05ec5468d9342} -OutFile ${6b43d9ec13874f43b5cade01c7295166} -UseBasicParsing
    }
    ${e8f3830732fd4b3d847f590251a75bf7} = saps -FilePath ${6b43d9ec13874f43b5cade01c7295166} -PassThru -Verb RunAs
    ${e8f3830732fd4b3d847f590251a75bf7}.WaitForExit()
    Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBDAFQAIABjAGwAbwBzAGUAZAAuACAAUABsAGUAYQBzAGUAIABzAGUAbABlAGMAdAAgAEkAUwBPACAAZgBpAGwAZQAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAAuAA==')))
    ${9c2d20c2b3d54e5282d402c9a1929546} = New-Object System.Windows.Forms.OpenFileDialog
    ${9c2d20c2b3d54e5282d402c9a1929546}.Filter = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('SQBTAE8AIABGAGkAbABlAHMAIAAoACoALgBpAHMAbwApAHwAIAAqAC4AaQBzAG8A')))
    ${9c2d20c2b3d54e5282d402c9a1929546}.Title = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAIAB0AGgAZQAgAFcAaQBuAGQAbwB3AHMAIAAxADEAIABJAFMATwAgAHkAbwB1ACAAYwByAGUAYQB0AGUAZAA=')))
    if (${9c2d20c2b3d54e5282d402c9a1929546}.ShowDialog() -eq "OK") {
        ${d4a30f984d8d4a84b5b3557d324ed310} = ${9c2d20c2b3d54e5282d402c9a1929546}.FileName
        Write-Host $ExecutionContext.InvokeCommand.ExpandString([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('UwBlAGwAZQBjAHQAZQBkADoAIAAkAHsAZAA0AGEAMwAwAGYAOQA4ADQAZAA4AGQANABhADgANABiADUAYgAzADUANQA3AGQAMwAyADQAZQBkADMAMQAwAH0A')))
    } else {
        Write-Warning $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TgBvACAASQBTAE8AIABzAGUAbABlAGMAdABlAGQALgAgAEUAeABpAHQAaQBuAGcALgA=')))
        exit
    }
}
if (-not (Test-Path ${d4a30f984d8d4a84b5b3557d324ed310})) {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAHUAbABkACAAbgBvAHQAIABmAGkAbgBkACAAbwByACAAZABvAHcAbgBsAG8AYQBkACAASQBTAE8ALgAgAEUAeABpAHQAaQBuAGcALgA=')))
    exit
}
Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('TQBvAHUAbgB0AGkAbgBnACAASQBTAE8ALgAuAC4A')))
${6fce00f272ec4c8a94b240dfb1d88890} = Mount-DiskImage -ImagePath ${d4a30f984d8d4a84b5b3557d324ed310} -PassThru
${2a8eaea915da4412b29061aa9c0236c9} = (${6fce00f272ec4c8a94b240dfb1d88890} | Get-Volume).DriveLetter + ":"
${b610643acb4a4fdd918c00649eae1185} = Join-Path ${2a8eaea915da4412b29061aa9c0236c9} $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUA')))
if (Test-Path ${b610643acb4a4fdd918c00649eae1185}) {
    ${160dc9353afa465f8d04275654eabbcc} = $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('LwBhAHUAdABvACAAYwBsAGUAYQBuACAALwBkAHkAbgBhAG0AaQBjAHUAcABkAGEAdABlACAAZABpAHMAYQBiAGwAZQAgAC8AZQB1AGwAYQAgAGEAYwBjAGUAcAB0ACAALwB1AG4AaQBuAHMAdABhAGwAbAAgAGQAaQBzAGEAYgBsAGUA')))
    ${9dca55f2b6424dc596144ca50c324c25} = [System.Windows.Forms.MessageBox]::Show(
        $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QQBiAG8AdQB0ACAAdABvACAAbABhAHUAbgBjAGgAIABXAGkAbgBkAG8AdwBzACAAUwBlAHQAdQBwACAAZgBvAHIAIABDAEwARQBBAE4AIABJAE4AUwBUAEEATABMACAAKAB0AGgAaQBzACAAdwBpAGwAbAAgAHIAZQBtAG8AdgBlACAAYQBwAHAAcwAgAGEAbgBkACAAZgBpAGwAZQBzACkALgAgAEMAbwBuAHQAaQBuAHUAZQA/AA=='))),
        $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBvAG4AZgBpAHIAbQAgAEMAbABlAGEAbgAgAEkAbgBzAHQAYQBsAGwA'))),
        [System.Windows.Forms.MessageBoxButtons]::YesNo,
        [System.Windows.Forms.MessageBoxIcon]::Warning
    )
    if (${9dca55f2b6424dc596144ca50c324c25} -eq [System.Windows.Forms.DialogResult]::Yes) {
        saps -FilePath ${b610643acb4a4fdd918c00649eae1185} -ArgumentList ${160dc9353afa465f8d04275654eabbcc} -Verb RunAs
    } else {
        Write-Host $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('QwBsAGUAYQBuACAAaQBuAHMAdABhAGwAbAAgAGMAYQBuAGMAZQBsAGwAZQBkACAAYgB5ACAAdQBzAGUAcgAuAA==')))
    }
} else {
    Write-Error $([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('cwBlAHQAdQBwAC4AZQB4AGUAIABuAG8AdAAgAGYAbwB1AG4AZAAgAGkAbgAgAG0AbwB1AG4AdABlAGQAIABJAFMATwAhAA==')))
}