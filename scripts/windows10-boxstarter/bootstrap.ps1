#Requires -RunAsAdministrator

# Open PowerShell command with Admin priviledges
# Paste the below line in the shell and execute it
# Then run this script again
Set-ExecutionPolicy Unrestricted -Scope Process -Force

# Intall Boxstarter/Chocolatey
. { Invoke-WebRequest -useb https://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; Get-Boxstarter -Force

# install git and download essential installer files
Write-BoxstarterMessage "Inatalling Git Bash"
choco install -y git -params '"/GitAndUnixToolsOnPath"'
refreshenv
# TODO: Setup .bashrc environment variables

# TODO: pull down the Boxter git repo
