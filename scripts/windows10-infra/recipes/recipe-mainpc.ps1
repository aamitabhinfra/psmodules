Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling WSL & Hyper-V, vagrant"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y Microsoft-Hyper-V-All -source windowsFeatures
choco install -y vagrant
# Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu.appx -UseBasicParsing
# Add-AppxPackage -Path ~/Ubuntu.appx
# RefreshEnv
# Ubuntu1804 install --root
# Ubuntu1804 run apt update
# Ubuntu1804 run apt upgrade

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling Base applications"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y sysinternals
choco install -y pdftk
choco install -y putty
choco install -y SublimeText3
# choco install -y SublimeText3.PackageControl
choco install -y googlechrome
# choco install -y syncbackfree --ignore-checksums
# choco install -y onenote
choco install -y firefox
choco install -y windirstat
choco install -y rufus
choco install -y vscode
choco install -y 7zip
choco install -y winrar
choco install -y ccleaner
# choco install -y adobereader

# Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
# Write-BoxstarterMessage "Inatalling Security applications"
# Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
# choco install -y 1password

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling software development applications"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install miniconda3 -y --params="'/AddToPath:1'"

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling Social, Collab, Audio, Video applications"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y whatsapp
choco install -y zoom-client
choco install -y itunes
choco install -y audacity
choco install -y audacity-lame
choco install -y ffmpeg
choco install -y mp3tag
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
# choco install -y boxsync
# choco install -y dropbox

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling Photo applications"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y imagemagick
choco install -y irfanview

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling benchmark applications"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
choco install -y cinebench
choco install -y coretemp
choco install -y cpu-z
choco install -y gpu-z
choco install -y msiafterburner
choco install -y cinebench
choco install -y prime95
choco install -y as-ssd

Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
Write-BoxstarterMessage "Inatalling Low Priority applications"
Write-Host "------------------------------------------------------------" -ForegroundColor Yellow
# choco install -y teamviewer
choco install -y nodejs.install
# choco install -y jdk8
# choco install -y jre8
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