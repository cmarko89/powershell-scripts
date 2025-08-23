# Run this script from an elevated PowerShell prompt (Run as Administrator recommended)

# Ensure TLS 1.2 is used
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Destination path for the Media Creation Tool executable
$destination = "$env:USERPROFILE\Downloads\MediaCreationTool_Win11.exe"

# Official Microsoft download link for the Media Creation Tool (Windows 11)
# Always verify the latest link from: https://www.microsoft.com/software-download/windows11
$mctUrl = "https://go.microsoft.com/fwlink/?linkid=2156295"

Write-Host "Downloading Windows 11 Media Creation Tool..."
Invoke-WebRequest -Uri $mctUrl -OutFile $destination

Write-Host "Download complete. File saved to $destination"
Write-Host "Launching the Media Creation Tool..."

# Launch the Media Creation Tool so the user can proceed with the guided installation
Start-Process -FilePath $destination -Verb RunAs