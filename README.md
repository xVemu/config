# config

## Any linux
`wget -O - -q https://raw.githubusercontent.com/xVemu/config/refs/heads/master/install.sh | sh -s --`

## Ubuntu
`bash -c "$(wget -O- http://vemu.ddns.net/script.sh)"`

## Windows
1. run `winget install --id Git.Git && winget install --id Google.Drive && git clone https://github.com/xVemu/config.git`
2. open gdrive
3. run `.\install.ps1 -ExecutionPolicy Unrestricted` in .net powershell