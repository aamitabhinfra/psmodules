Write-Host "-----------------------------------------" -ForegroundColor Yellow
Write-Host "Install bootstrap: Boxstarter/Choco, etc." -ForegroundColor Yellow
Write-Host "-----------------------------------------" -ForegroundColor Yellow
Set-ExecutionPolicy Unrestricted -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/bootstrap.ps1'))

Write-Host "----------------------------" -ForegroundColor Yellow
Write-Host "Install base applicaitons" -ForegroundColor Yellow
Write-Host "----------------------------" -ForegroundColor Yellow
Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/Install-Base.txt

Write-Host "-----------------------------" -ForegroundColor Yellow
Write-Host "Install Applicaitons" -ForegroundColor Yellow
Write-Host "-----------------------------" -ForegroundColor Yellow

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling WSL & Hyper-V, vagrant"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y Microsoft-Hyper-V-All -source windowsFeatures
choco install vagrant
# Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu.appx -UseBasicParsing
# Add-AppxPackage -Path ~/Ubuntu.appx
# RefreshEnv
# Ubuntu1804 install --root
# Ubuntu1804 run apt update
# Ubuntu1804 run apt upgrade

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling Base applciations"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y sysinternals
choco install -y pdftk
choco install -y putty
choco install -y SublimeText3
# choco install -y SublimeText3.PackageControl
# choco install -y googlechrome
choco install -y syncbackfree
# choco install -y onenote
choco install -y firefox
choco install -y windirstat
choco install -y rufus
choco install -y vscode
choco install -y 7zip
choco install -y winrar
choco install -y ccleaner
choco install -y adobereader

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling Security applciations"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
# choco install -y 1password

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling software development applciations"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y anaconda3

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling Social, Collab, Audio, Video applciations"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y whatsapp
choco install -y zoom-client
choco install -y itunes
choco install -y audacity
choco install -y audacity-lame
choco install -y ffmpeg
choco install -y mediainfo
choco install -y spek
choco install -y mkvtoolnix
choco install -y vlc
choco install -y spotify
choco install -y discord

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling Cloud drives"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y googledrive
choco install -y boxsync
choco install -y dropbox

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling Photo applciations"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y imagemagick
choco install -y irfanview

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling benchmark applciations"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y cinebench
choco install -y coretemp
choco install -y cpu-z

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling Low Priority applciations"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y teamviewer
choco install -y nodejs.install
choco install -y jdk8
# choco install -y jre8
choco install -y discord.install
choco install -y discord
choco install -y kindle
choco install -y calibre

# May not work
# choco install -y myharmony
# choco install -y Bandicam
# choco install -y Capture NX 2
# choco install -y dbpoweramp
# choco install -y epson scan
# choco install -y geosetter
# choco install -y harmony remote
# choco install -y picasa3

Enable-UAC