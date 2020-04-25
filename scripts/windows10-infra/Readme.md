# Configure a vanilla Windows 10 environment

## bootstrap:
The script will install _Boxstarter_, _Chocolatey_, _Setup Network Discovery_ and _File Sharing_, _Git_, and download the main _"psmodule"_ Git repo
1. Open powershell in admin mode and execute the following command:
   ```powershell
   Set-ExecutionPolicy Unrestricted -Scope Process -Force
   ```
2. Execute command:
   ```powershell
   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/bootstrap.ps1'))
   ```

## base installation
Sets up _ExplorerOptions_, _UI_, _Privacy_, _Remove Microsoft junk_, _Update Windows_
   
   Execute the following command
   ```powershell
   Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/recipes/Install-Base.txt
   ```

## apps install
Execute the following command
   ```powershell
   Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/recipes/Install-Apps.txt
   ```
