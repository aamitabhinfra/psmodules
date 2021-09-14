# Windows 10 Environment creation recipes
Each recipe internally calls bootstrap.ps1 and Install-Base.ps1 via BoxStarter

Bootstrapping script included the following packages: _Boxstarter_, _Chocolatey_, _Setup Network Discovery_ and _File Sharing_, _Git_, and download the main _"psmodule"_ Git repo

## Pre-Requisite step for all recipes
Open powershell in admin mode and execute the following commands:
   ```powershell
   Set-ExecutionPolicy Unrestricted -Scope Process -Force

   # Define repository environment
   $env:REPO_HOME="d:\source\repos"

   # Install GIT manually
   ```

## Invoking Main Recipe

   ### MAINPC
   ```powershell
   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/recipes/recipe-mainpc.ps1'))
   ```

   ### K2FHPC
   ```powershell
   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/recipes/recipe-allapps.ps1'))
   ```

   ### AMITYOGA Lenovo 370
   ```powershell
   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/recipes/recipe-amityoga.ps1'))
   ```
   ### Recipe: ML as testing ground
   ```powershell
   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/recipes/recipe-ml.ps1'))
   ```

## Optional Post-Steps

   ```powershell
   # Setup passwordless GIT
   ssh-keygen -t rsa -b 4096 -C "amitabh.arora@gmail.com"
   eval "$(ssh-agent -s)"
   cat ~/.ssh/id_rsa.pub | clip

   # Install minocomda
   choco install miniconda3 -y --params="'/AddToPath:1'"
   ```

