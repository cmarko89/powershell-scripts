# Run this script as Administrator

# --- Helper function: Check if systemreset is available ---
function Test-SystemReset {
    try {
        Get-Command systemreset -ErrorAction Stop | Out-Null
        return $true
    } catch {
        return $false
    }
}

# --- Step 0: If systemreset is available, just run it ---
if (Test-SystemReset) {
    Write-Host "systemreset is available. Launching factory reset UI..."
    Start-Process "systemreset.exe" -ArgumentList "-factoryreset"
    exit
}
else {
    Write-Host "systemreset not found or unusable. Attempting recovery repair..."

    # --- Step 1: Download Media Creation Tool ---
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $destination = "$env:USERPROFILE\Downloads\MediaCreationTool_Win11.exe"
    $mctUrl = "https://go.microsoft.com/fwlink/?linkid=2156295"

    if (-Not (Test-Path $destination)) {
        Write-Host "Downloading Media Creation Tool..."
        Invoke-WebRequest -Uri $mctUrl -OutFile $destination -UseBasicParsing
    }
    Write-Host "Download complete: $destination"

    # --- Step 2: Run MCT and wait for exit ---
    Write-Host "Launching Media Creation Tool. Please use it to create a Windows 11 ISO..."
    $proc = Start-Process -FilePath $destination -Verb RunAs -PassThru
    $proc.WaitForExit()
    Write-Host "Media Creation Tool closed."

    # --- Step 3: Prompt user to select created ISO ---
    Add-Type -AssemblyName System.Windows.Forms
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
    $FileBrowser.Filter = "ISO Files (*.iso)| *.iso"
    $FileBrowser.Title = "Select the ISO you just created with the Media Creation Tool"

    if ($FileBrowser.ShowDialog() -eq "OK") {
        $isoPath = $FileBrowser.FileName
        Write-Host "Selected ISO: $isoPath"
    } else {
        Write-Warning "No ISO selected. Exiting."
        exit
    }

    # --- Step 4: Mount ISO ---
    Write-Host "Mounting ISO..."
    $mount = Mount-DiskImage -ImagePath $isoPath -PassThru
    $driveLetter = ($mount | Get-Volume).DriveLetter + ":"
    Write-Host "Mounted ISO at $driveLetter"

    # --- Step 5: Find install.wim or install.esd ---
    $installWim = Join-Path $driveLetter "sources\install.wim"
    $installEsd = Join-Path $driveLetter "sources\install.esd"
    if (Test-Path $installWim) {
        $srcImage = $installWim
    } elseif (Test-Path $installEsd) {
        $srcImage = $installEsd
    } else {
        Write-Error "No install.wim/esd found in ISO!"
        Dismount-DiskImage -ImagePath $isoPath
        exit
    }
    Write-Host "Install image found: $srcImage"

    # --- Step 6: Detect local edition for correct index ---
    $localEdition = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").EditionID
    Write-Host "Local Edition detected: $localEdition"

    $wimInfo = & dism /get-wiminfo /wimfile:$srcImage
    $selectedIndex = $null
    $currentIndex = $null

    foreach ($line in $wimInfo) {
        if ($line -match "Index : (\d+)") {
            $currentIndex = $matches[1]
        }
        elseif ($line -match "Edition : (.+)") {
            $edition = $matches[1].Trim()
            if ($edition -eq $localEdition) {
                $selectedIndex = $currentIndex
                break
            }
        }
    }

    if (-not $selectedIndex) {
        Write-Warning "Could not find a matching index for $localEdition. Defaulting to Index 1."
        $selectedIndex = 1
    }

    Write-Host "Using Image Index: $selectedIndex (Edition: $localEdition)"

    # --- Step 7: Mount that index and get Winre.wim ---
    $mountPath = "$env:TEMP\WimMount"
    if (-not (Test-Path $mountPath)) { New-Item -ItemType Directory -Path $mountPath | Out-Null }

    Write-Host "Mounting image index $selectedIndex..."
    dism /Mount-Wim /WimFile:$srcImage /index:$selectedIndex /MountDir:$mountPath | Out-Null

    $winreSource = Join-Path $mountPath "Windows\System32\Recovery\Winre.wim"
    $winreTargetDir = "C:\Windows\System32\Recovery"
    if (-not (Test-Path $winreTargetDir)) { New-Item -ItemType Directory -Path $winreTargetDir | Out-Null }

    if (Test-Path $winreSource) {
        Copy-Item $winreSource (Join-Path $winreTargetDir "Winre.wim") -Force
        Write-Host "Winre.wim copied to $winreTargetDir"
    } else {
        Write-Error "WinRE.wim not found in mounted WIM!"
    }

    dism /Unmount-Wim /MountDir:$mountPath /discard | Out-Null
    Remove-Item $mountPath -Recurse -Force
    Dismount-DiskImage -ImagePath $isoPath | Out-Null

    # --- Step 8: Register WinRE & enable ---
    reagentc /setreimage /path $winreTargetDir
    reagentc /enable

    Write-Host "`nRecovery environment configured. Current status:"
    reagentc /info

    # --- Step 9: Run systemreset ---
    if (Test-SystemReset) {
        Write-Host "`nLaunching systemreset. Reboot may be required for it to take effect properly."
        Start-Process "systemreset.exe" -ArgumentList "-factoryreset"
    } else {
        Write-Warning "Systemreset still not available. Please reboot and run the script again."
    }
}