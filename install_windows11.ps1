# Run as Administrator!
# Helper function: test if systemreset is available
function Test-SystemReset {
    try {
        Get-Command systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

if (Test-SystemReset) {
    Write-Host "systemreset is available. Launching factory reset UI..."
    Start-Process "systemreset.exe" -ArgumentList "-factoryreset"
    exit
}
else {
    Write-Host "systemreset not found or unusable. Attempting recovery via Media Creation Tool..."

    # Step 1: Download Media Creation Tool
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $destination = "$env:USERPROFILE\Downloads\MediaCreationTool_Win11.exe"
    $mctUrl = "https://go.microsoft.com/fwlink/?linkid=2156295"

    Write-Host "Downloading Media Creation Tool..."
    Invoke-WebRequest -Uri $mctUrl -OutFile $destination -UseBasicParsing
    Write-Host "Download complete: $destination"

    # Step 2: Launch Media Creation Tool and wait for it to exit
    Write-Host "Launching Media Creation Tool. Use it to create installation ISO and remember its location..."
    $proc = Start-Process -FilePath $destination -Verb RunAs -PassThru
    $proc.WaitForExit()
    Write-Host "Media Creation Tool closed."

    # Step 3: Prompt user to select the ISO created
    Add-Type -AssemblyName System.Windows.Forms
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
    $FileBrowser.Filter = "ISO Files (*.iso)| *.iso"
    $FileBrowser.Title = "Select the ISO you just created with the Media Creation Tool"

    if ($FileBrowser.ShowDialog() -eq "OK") {
        $isoPath = $FileBrowser.FileName
        Write-Host "You selected $isoPath"
    } else {
        Write-Warning "No ISO selected. Exiting."
        exit
    }

    # Step 4: Mount ISO
    Write-Host "Mounting ISO..."
    $mount = Mount-DiskImage -ImagePath $isoPath -PassThru
    $driveLetter = ($mount | Get-Volume).DriveLetter + ":"
    Write-Host "Mounted ISO at drive $driveLetter"

    # Step 5: Locate install.wim or install.esd
    $installWim = Join-Path $driveLetter "sources\install.wim"
    $installEsd = Join-Path $driveLetter "sources\install.esd"
    if (Test-Path $installWim) {
        $srcImage = $installWim
    } elseif (Test-Path $installEsd) {
        $srcImage = $installEsd
    } else {
        Write-Error "No install.wim or install.esd found in ISO!"
        Dismount-DiskImage -ImagePath $isoPath
        exit
    }
    Write-Host "Found image file: $srcImage"

    # Step 6: Mount image temporarily to extract WinRE.wim
    $mountPath = "$env:TEMP\WimMount"
    if (-not (Test-Path $mountPath)) { New-Item -ItemType Directory -Path $mountPath | Out-Null }

    Write-Host "Mounting Windows image (index 1)..."
    dism /Mount-Wim /WimFile:$srcImage /index:1 /MountDir:$mountPath | Out-Null

    $winreSource = Join-Path $mountPath "Windows\System32\Recovery\Winre.wim"
    $winreTargetDir = "C:\Windows\System32\Recovery"
    if (-not (Test-Path $winreTargetDir)) { New-Item -ItemType Directory -Path $winreTargetDir | Out-Null }

    if (Test-Path $winreSource) {
        Copy-Item $winreSource $winreTargetDir -Force
        Write-Host "Copied Winre.wim to $winreTargetDir"
    } else {
        Write-Error "Winre.wim not found inside mounted image."
    }

    # Unmount the WIM
    dism /Unmount-Wim /MountDir:$mountPath /discard | Out-Null
    Remove-Item $mountPath -Recurse -Force
    Dismount-DiskImage -ImagePath $isoPath | Out-Null

    # Step 7: Register & enable WinRE
    reagentc /setreimage /path $winreTargetDir
    reagentc /enable

    Write-Host "`nRecovery environment set up. Verifying status:"
    reagentc /info

    # Step 8: Launch systemreset
    if (Test-SystemReset) {
        Write-Host "`nNow launching systemreset with factory reset..."
        Start-Process "systemreset.exe" -ArgumentList "-factoryreset"
    } else {
        Write-Warning "Systemreset still not available. Please reboot and try again."
    }
}