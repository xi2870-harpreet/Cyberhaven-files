$ErrorActionPreference = "Stop"

$dest = "C:\Workshop\Files"
$zip = "C:\temp.zip"
$extract = "C:\temp-extract"

New-Item -ItemType Directory -Force -Path $dest | Out-Null

Invoke-WebRequest `
  -Uri "https://codeload.github.com/jparton/Cyberhaven-files/zip/refs/heads/main" `
  -OutFile $zip

Expand-Archive -Path $zip -DestinationPath $extract -Force

Copy-Item `
  -Path "$extract\Cyberhaven-files-main\*" `
  -Destination $dest `
  -Recurse -Force

Remove-Item $zip -Force
Remove-Item $extract -Recurse -Force

Write-Output "Files copied successfully"
