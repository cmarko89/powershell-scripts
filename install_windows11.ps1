# Run as Administrator

function Test-SystemReset {
    try {
        Get-Command systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

if (Test-SystemReset) {
    Write-Host "SystemReset available. Launching..."
    Start-Process "systemreset.exe" -ArgumentList "-factoryreset"
    exit
}
else {
    Write-Host "SystemReset not available. Using Setup.exe clean install path..."

    # 1. Download Media Creation Tool
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $destination = "$env:USERPROFILE\Downloads\MediaCreationTool_Win11.exe"
    $mctUrl = "https://go.microsoft.com/fwlink/?linkid=2156295"

    if (-Not (Test-Path $destination)) {
        Write-Host "Downloading Media Creation Tool..."
        Invoke-WebRequest -Uri $mctUrl -OutFile $destination -UseBasicParsing
    }
    Write-Host "Media Creation Tool saved at: $destination"

    # 2. Launch MCT and wait for finish
    $proc = Start-Process -FilePath $destination -Verb RunAs -PassThru
    $proc.WaitForExit()
    Write-Host "Media Creation Tool closed. Now select ISO..."

    # 3. File picker for ISO
    Add-Type -AssemblyName System.Windows.Forms
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
    $FileBrowser.Filter = "ISO Files (*.iso)| *.iso"
    $FileBrowser.Title = "Select the ISO you created"
    if ($FileBrowser.ShowDialog() -eq "OK") {
        $isoPath = $FileBrowser.FileName
        Write-Host "Selected: $isoPath"
    } else {
        Write-Warning "No ISO chosen. Exiting."
        exit
    }

    # 4. Mount ISO
    Write-Host "Mounting ISO..."
    $mount = Mount-DiskImage -ImagePath $isoPath -PassThru
    $driveLetter = ($mount | Get-Volume).DriveLetter + ":"
    Write-Host "ISO mounted at $driveLetter"

    # 5. Run setup.exe with /auto clean
    $setupExe = Join-Path $driveLetter "setup.exe"
    if (Test-Path $setupExe) {
        Write-Host "Launching Windows Setup for clean install..."
        Start-Process -FilePath $setupExe -ArgumentList "/auto clean /dynamicupdate disable /compactos /compat ignorewarning /eula accep /uninstall disable" -Verb RunAs
    } else {
        Write-Error "setup.exe not found in ISO!"
    }
}