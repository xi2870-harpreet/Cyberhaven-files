$ErrorActionPreference = "Stop"

Write-Output "Starting dependency installation..."

$downloadDir = "C:\Workshop\Installers"
New-Item -ItemType Directory -Force -Path $downloadDir | Out-Null

# --------------------------------------------------
# 1. Visual Studio 2010 Tools for Office Runtime
# --------------------------------------------------
$vstoUrl = "https://download.microsoft.com/download/1/5/2/152C22A9-38B4-4F5C-A1B4-7B7E0F8A0E89/vstor_redist.exe"
$vstoInstaller = "$downloadDir\vstor_redist.exe"

if (-not (Test-Path "HKLM:\SOFTWARE\Microsoft\VSTO Runtime Setup\v4")) {
    Write-Output "Installing VSTO 2010 Runtime..."
    Invoke-WebRequest -Uri $vstoUrl -OutFile $vstoInstaller
    Start-Process $vstoInstaller -ArgumentList "/quiet /norestart" -Wait
    Write-Output "VSTO 2010 Runtime installed."
} else {
    Write-Output "VSTO 2010 Runtime already installed. Skipping."
}

# --------------------------------------------------
# 2. Latest Microsoft Visual C++ Redistributable (x64)
# --------------------------------------------------
$vcppUrl = "https://aka.ms/vs/17/release/vc_redist.x64.exe"
$vcppInstaller = "$downloadDir\vc_redist.x64.exe"

Write-Output "Installing Visual C++ Redistributable..."
Invoke-WebRequest -Uri $vcppUrl -OutFile $vcppInstaller
Start-Process $vcppInstaller -ArgumentList "/install /quiet /norestart" -Wait
Write-Output "Visual C++ Redistributable installed."

Write-Output "All dependencies installed successfully."
