winget import .\windows\files\winget.json --accept-package-agreements

# refreshes path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# setup
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
$drive = "G:\My drive\Format"
$download = "$HOME\Downloads"
$desktop = "$HOME\Desktop"
$files = ".\windows\files"
setx PATH "$env:path;$download;$HOME" -m

# copy files
Copy-Item "$files\.gitconfig" $HOME
mkdir "$HOME\.ssh"
Copy-Item "$drive\.ssh\id_ed25519" "$HOME\.ssh\id_ed25519"
Copy-Item "$drive\.ssh\config" "$HOME\.ssh\config"
Copy-Item "$drive\powertoys.ptb" "$HOME\Documents\PowerToys\Backup\powertoys.ptb"
# Copy-Item ".\windows\jdk.bat" $HOME

# desktop
Copy-Item "$drive\Pulpit\*" $desktop -Recurse
Copy-Item ".\windows\dekstop\*" $desktop -Recurse
Copy-Item "$files\bttv_settings.backup" $desktop
mkdir "$desktop\steam"
Copy-Item "$drive\steam\*" "$desktop\steam" -Recurse

# polmak
Expand-Archive "$files\polmak12.zip" -DestinationPath $download
reg import "$download\polmak12\Caps to Backspace.reg"
& "$download\polmak12\setup.exe"
Remove-Item -Recurse "$download\polmak12"

# custom path
# mkdir "C:\Riot Games\League of Legends\Config\"
# Copy-Item "$files\LOL Config\*" "C:\Riot Games\League of Legends\Config\" -Recurse
mkdir "C:\Program Files\OpenVPN\config"
Copy-Item "$drive\wykladowca" "C:\Program Files\OpenVPN\config\" -Recurse
Copy-Item "$files\terminal.json" "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# oh my posh
Copy-Item $files\cobalt2.omp.json $HOME

New-Item -Path $PROFILE -Type File -Force
Copy-Item $files\profile.ps1 $PROFILE

Install-Module z -AllowClobber
Install-Module PSReadLine -AllowPrerelease -Force
Install-Module -Name Terminal-Icons -Repository PSGallery

oh-my-posh font install

. $PROFILE

# open rest download pages in browser
foreach($item in Get-Content .\windows\sites.txt) {
    & "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe" $item
}
