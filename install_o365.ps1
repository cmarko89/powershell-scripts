# PowerShell script to download and install Microsoft 365 Apps (Current Channel, x64, silent with progress)

$downloadUrl = "https://officecdn.microsoft.com/pr/wsus/setup.exe"
$tempDir     = "$env:TEMP\OfficeDeploy"
$setupPath   = Join-Path $tempDir "setup.exe"
$configPath  = Join-Path $tempDir "config.xml"

# Ensure temp working folder
if (-not (Test-Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir | Out-Null
}

Write-Host "Downloading Office setup bootstrapper..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $setupPath -UseBasicParsing

# Define configuration XML
$configXml = @"
<Configuration>
  <Add OfficeClientEdition="64" Channel="Current">
    <!-- Add specific products here, e.g. O365ProPlusRetail -->
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
    </Product>
  </Add>
  <Display Level="Full" AcceptEULA="TRUE" />
  <Property Name="AUTOACTIVATE" Value="1" />
</Configuration>
"@

# Write configuration XML file
$configXml | Out-File -FilePath $configPath -Encoding UTF8

Write-Host "Starting Office installation..."
# Start setup silently with progress UI only
Start-Process -FilePath $setupPath -ArgumentList "/configure `"$configPath`"" -Wait -NoNewWindow

Write-Host "Office installation completed."