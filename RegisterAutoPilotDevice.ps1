# Ensure script runs without user intervention

# 1. Temporarily bypass execution policy for this session
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# 2. Install the script silently (no confirmation prompts)
Install-Script -Name Get-WindowsAutoPilotInfo -Force -Scope CurrentUser -Confirm:$false

# 3. Ensure the script is available in the path
$scriptPath = Join-Path $env:USERPROFILE "Documents\PowerShell\Scripts\Get-WindowsAutoPilotInfo.ps1"

# Run the script online
& $scriptPath -Online