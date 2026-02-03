[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$dest = "C:\Workshop\Files"
$temp = "C:\temp"
$zip = "$temp\repo.zip"
$extract = "$temp\repo"

New-Item -ItemType Directory -Force -Path $dest | Out-Null
New-Item -ItemType Directory -Force -Path $temp | Out-Null

Write-Output "Downloading GitHub repository..."

Invoke-WebRequest `
  -Uri "https://codeload.github.com/xi2870-harpreet/Cyberhaven-files/zip/refs/heads/main" `
  -OutFile $zip

Write-Output "Extracting repository..."
Expand-Archive -Path $zip -DestinationPath $extract -Force

Write-Output "Copying files to C:\Workshop\Files..."
Copy-Item `
  -Path "$extract\Cyberhaven-files-main\*" `
  -Destination $dest `
  -Recurse -Force

Write-Output "Files copied successfully"
