$result = Invoke-RestMethod -Uri "https://api.nasa.gov/planetary/apod?api_key=RAarp1XLTlplmQ0FywIKKAXcVbUHkinYmRYB9tYl" -Headers @{"Accept"="*/*"}
Invoke-WebRequest $result.hdurl -OutFile $ENV:UserProfile\wallpaper.jpg
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d $ENV:UserProfile\wallpaper.jpg /f
Start-Sleep -s 10
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True
