oh-my-posh init pwsh --config ~/cobalt2.omp.json | Invoke-Expression
Import-Module -Name Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Invoke-Expression "$(vfox activate pwsh)"
