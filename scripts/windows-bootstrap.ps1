[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

Start-Transcript -Path C:\Windows\Temp\windows-bootstrap.log -Append

Write-Output "Starting Windows bootstrap..."

& "$PSScriptRoot\copy-files.ps1"
& "$PSScriptRoot\install-dependencies.ps1"

Write-Output "Windows bootstrap completed successfully"

Stop-Transcript
