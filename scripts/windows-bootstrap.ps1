$ErrorActionPreference = "Stop"

Write-Output "Starting Windows bootstrap..."

# Run file copy
& "$PSScriptRoot\copy-files.ps1"

# Install dependencies
& "$PSScriptRoot\install-dependencies.ps1"

Write-Output "Windows bootstrap completed successfully"
