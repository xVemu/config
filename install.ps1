winget import .\windows\winget.json

# refreshes path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# setup
$drive = "G:\Mój dysk\Format"
$download = "$HOME\Downloads"
$desktop = "$HOME\Desktop"
setx PATH "$env:path;$download" -m

# copy files
Copy-Item .\windows\.gitconfig $HOME
Copy-Item "$drive\.ssh" $HOME -Recurse

# desktop
Copy-Item "$drive\Pulpit\*" $desktop -Recurse
Copy-Item "$drive\bttv_settings.backup" $desktop
Copy-Item "$drive\radeon.zip" $desktop
Copy-Item ".\windows\dailywallpaper.ps1" $desktop

# downloads
Copy-Item ".\windows\jdk.bat" $download
Copy-Item "$drive\fiszkoteka.exe" $download
Expand-Archive "$drive\polmak12.zip" -DestinationPath $download
reg import "$download\polmak12\Caps to Backspace.reg"
& "$download\polmak12\setup.exe"
Remove-Item -Recurse polmak12
Remove-Item polmak12.zip

# custom path
mkdir "C:\Riot Games\League of Legends\Config\"
Copy-Item "$drive\LOL Config\*" "C:\Riot Games\League of Legends\Config\" -Recurse
mkdir "C:\Program Files\OpenVPN\config"
Copy-Item "$drive\wykladowca" "C:\Program Files\OpenVPN\config\" -Recurse
Copy-Item "$drive\igconfig.xml" "C:\Program Files\ImageGlass\"
Copy-Item ".\windows\terminal.json" "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"


# oh my posh
Copy-Item .\windows\cobalt2.omp.json $HOME

New-Item -Path $PROFILE -Type File -Force
Copy-Item .\windows\profile.ps1 $PROFILE

Install-Module z -AllowClobber
Install-Module PSReadLine
Install-Module -Name Terminal-Icons -Repository PSGallery

oh-my-posh font install

. $PROFILE

# open rest download pages in browser
Invoke-WebRequest "https://github.com/Freaky/Compactor/releases/download/v0.10.1/Compactor-0.10.1.zip" -OutFile $download


foreach($item in Get-Content .\windows\sites.txt) {
    & "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\Application\brave.exe" $item
}

# clone all projects
mkdir "C:\AndroidProjects"
mkdir "C:\JavaProjects"
mkdir "C:\NodeProjects"
git clone git@github.com:xVemu/sociely.git "C:\JavaProjects\"
git clone git@github.com:xVemu/diamold.git "C:\JavaProjects\"
git clone git@github.com:xVemu/zsme.git "C:\AndroidProjects\"
git clone git@github.com:xVemu/dsbot.git "C:\NodeProjects\"
