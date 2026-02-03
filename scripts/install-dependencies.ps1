$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

New-Item -ItemType Directory -Force -Path C:\temp | Out-Null

# Visual C++ Redistributable
Invoke-WebRequest `
  -Uri https://aka.ms/vs/17/release/vc_redist.x64.exe `
  -OutFile C:\temp\vc_redist.x64.exe

Start-Process C:\temp\vc_redist.x64.exe `
  -ArgumentList "/install /quiet /norestart" `
  -Wait

# VSTO 2010 Runtime
Invoke-WebRequest `
  -Uri https://download.microsoft.com/download/0/B/2/0B2E3A47-76E5-45C2-9B29-6C47C61F97B3/vstor_redist.exe `
  -OutFile C:\temp\vstor_redist.exe

Start-Process C:\temp\vstor_redist.exe `
  -ArgumentList "/quiet /norestart" `
  -Wait
