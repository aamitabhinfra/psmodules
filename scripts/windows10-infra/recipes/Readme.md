# Windows 10 Environment creation recipes

## Boxstarter / Chocolatey / Firewall / Network Discovery & Git
```powershell
Set-ExecutionPolicy Unrestricted -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/bootstrap.ps1'))
```

## Base Windows configuration
```powershell
Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/Install-Base.ps1
```

## Define REPO environment
```powershell
$env:REPO_HOME="d:\source\repos"

```

## Invoking Main Recipe
Substitue the following string in the command below the table:
   computer             | script
   --------             | -----------
   MAINPC               | mainpc
   K2FHPC               | allapps
   AMITYOGA Lenovo 370  | amityoga
   AMITYOGA temp        | amityogatemp
   ML                   | ml

   ```powershell
   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/recipes/recipe-{script}.ps1'))
   ```

## Optional Post-Steps

   ### Password-less Github access
   ```powershell
   # Setup passwordless GIT
   ssh-keygen -t rsa -b 4096 -C "amitabh.arora@gmail.com"
   eval "$(ssh-agent -s)"
   cat ~/.ssh/id_rsa.pub | clip
   ....copy clipboard to github ...
   ```
   
   ### Windows Terminal from Store

   ### WSL
   [Simplified Installation for Windows Insiders](https://docs.microsoft.com/en-us/windows/wsl/install-win10#simplified-installation-for-windows-insiders):
   1. Open an elevated command prompt
   2. Execute "```wsl --install```" command

   ### Docker Desktop
   1. Install from Docker Hub
   2. Reboot
   3. Enable WSL integration
   ### Miniconda3
   ``` powershell
   choco install miniconda3 -y --params="'/AddToPath:1'"
   ```

