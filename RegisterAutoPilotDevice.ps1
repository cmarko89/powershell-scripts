Set-ExecutionPolicy Bypass -Force -Scope Process
Install-Script -Name Get-WindowsAutoPilotInfo -Force -Scope CurrentUser -Confirm:$false
Get-WindowsAutoPilotInfo.ps1 -Online
