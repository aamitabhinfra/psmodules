# Configure a vanilla Windows 10 environment

## Bootstrapping:
The script will install _Boxstarter_, _Chocolatey_, _Setup Network Discovery_ and _File Sharing_, _Git_, and download the main _"psmodule"_ Git repo

Open powershell in admin mode and execute the following commands:
   ```powershell
   Set-ExecutionPolicy Unrestricted -Scope Process -Force

   Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/bootstrap.ps1'))
   ```

## Base installation
Sets up _ExplorerOptions_, _UI_, _Privacy_, _Remove Microsoft junk_, _Update Windows_.
   Execute the following command:
   ```powershell
   Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/Install-Base.txt
   ```

## VM Hyper-V, Vagrant
Execute the following command:
   ```powershell
   Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/Install-Apps.txt
   ```

## Apps installation
Execute the following command:
   ```powershell
   Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/Install-Apps.txt
   ```
