[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

$temp = "C:\temp"
New-Item -ItemType Directory -Force -Path $temp | Out-Null

# -----------------------------
# Install Visual C++ Redistributable (Latest)
# -----------------------------
Write-Output "Installing Visual C++ Redistributable..."

$vcUrl = "https://aka.ms/vs/17/release/vc_redist.x64.exe"
$vcExe = "$temp\vc_redist.x64.exe"

Invoke-WebRequest -Uri $vcUrl -OutFile $vcExe

Start-Process $vcExe `
  -ArgumentList "/install /quiet /norestart" `
  -Wait

# -----------------------------
# Install VSTO 2010 Runtime
# -----------------------------
Write-Output "Installing VSTO 2010 Runtime..."

$vstoUrl = "https://download.microsoft.com/download/0/B/2/0B2E3A47-76E5-45C2-9B29-6C47C61F97B3/vstor_redist.exe"
$vstoExe = "$temp\vstor_redist.exe"

Invoke-WebRequest -Uri $vstoUrl -OutFile $vstoExe

Start-Process $vstoExe `
  -ArgumentList "/quiet /norestart" `
  -Wait

Write-Output "All dependencies installed successfully"
