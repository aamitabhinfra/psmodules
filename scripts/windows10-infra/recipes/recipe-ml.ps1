Write-Host "-----------------------------------------" -Foreground Yellow
Write-Host "Install bootstrap: Boxstarter/Choco, etc." -Foreground Yellow
Write-Host "-----------------------------------------" -Foreground Yellow
Set-ExecutionPolicy Unrestricted -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/bootstrap.ps1'))

Write-Host "----------------------------" -Foreground Yellow
Write-Host "Install base applicaitons" -Foreground Yellow
Write-Host "----------------------------" -Foreground Yellow
Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/Install-Base.txt

Write-Host "-----------------------------" -Foreground Yellow
Write-Host "Install Applicaitons" -Foreground Yellow
Write-Host "-----------------------------" -Foreground Yellow

Write-Host "------------------------------------------------------------" -Foreground Yellow
Write-BoxstarterMessage "Inatalling a few apps"
Write-Host "------------------------------------------------------------" -Foreground Yellow

choco install -y audacity
choco install -y audacity-lame
choco install -y ffmpeg
choco install -y mediainfo
choco install -y adobereader