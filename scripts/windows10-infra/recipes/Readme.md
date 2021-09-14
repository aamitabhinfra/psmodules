# Windows 10 Environment creation recipes
Each recipe internally calls bootstrap.ps1 and Install-Base.ps1 via BoxStarter

Bootstrapping script included the following packages: _Boxstarter_, _Chocolatey_, _Setup Network Discovery_ and _File Sharing_, _Git_, and download the main _"psmodule"_ Git repo

## Pre-Requisite step for all recipes
Open powershell in admin mode and execute the following commands:
   ```powershell
   Set-ExecutionPolicy Unrestricted -Scope Process -Force
   ```

## Recipe: MAINPC: Uses _recipe-allapps.ps1_
This recipe installs all packages.
   ```powershell
   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/recipes/recipe-allapps.ps1'))
   ```
## Recipe: K2FHPC: Uses _recipe-allapps.ps1_
This recipe installs all packages.
   ```powershell
   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/recipes/recipe-allapps.ps1'))
   ```
## Recipe: AMITYOGA Lenovo 370
This recipe installs Machine Learning packages.
   ```powershell
   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/recipes/recipe-amityoga.ps1'))
   ```

## Recipe: ML as testing ground
This recipe installs Machine Learning packages.
   ```powershell
   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/recipes/recipe-ml.ps1'))
   ```