Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

Install-Script -Name Get-WindowsAutoPilotInfo -Force -Scope CurrentUser -Confirm:$false

Get-WindowsAutoPilotInfo.ps1 -Online