# Run as Administrator!
Add-Type -AssemblyName System.Windows.Forms

function Test-SystemReset {
    try {
        Get-Command systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

if (Test-SystemReset) {
    # Dialog box for Quick Reset vs Full Reinstall
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
    elseif ($form.Tag -eq "reinstall") {
        Write-Host "User chose Full Reinstall. Going into setup.exe workflow..."
        # fall through to full setup (below)
    } else {
        Write-Host "No choice made. Exiting."
        exit
    }
}

# --- Full Reinstall Path ---
Write-Host "Preparing Full Reinstall via setup.exe..."

# Download Media Creation Tool
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$destination = "$env:USERPROFILE\Downloads\MediaCreationTool_Win11.exe"
$mctUrl = "https://go.microsoft.com/fwlink/?linkid=2156295"

if (-Not (Test-Path $destination)) {
    Write-Host "Downloading Media Creation Tool..."
    Invoke-WebRequest -Uri $mctUrl -OutFile $destination -UseBasicParsing
}
Write-Host "Media Creation Tool saved at: $destination"

# Launch MCT and wait
$proc = Start-Process -FilePath $destination -Verb RunAs -PassThru
$proc.WaitForExit()
Write-Host "MCT closed. Please select the ISO file you created."

# ISO picker
Add-Type -AssemblyName System.Windows.Forms
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

# Mount ISO
Write-Host "Mounting ISO..."
$mount = Mount-DiskImage -ImagePath $isoPath -PassThru
$driveLetter = ($mount | Get-Volume).DriveLetter + ":"
Write-Host "ISO mounted at $driveLetter"

# Run setup.exe with supported switches
$setupExe = Join-Path $driveLetter "setup.exe"
if (Test-Path $setupExe) {
    # Safer, working set of switches:
    $args = "/auto clean /dynamicupdate disable /eula accept /uninstall disable"
    Write-Host "Launching Windows Setup with args: $args"
    Start-Process -FilePath $setupExe -ArgumentList $args -Verb RunAs
} else {
    Write-Error "setup.exe not found in ISO!"
}