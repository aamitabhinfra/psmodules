# Windows 10 Environment creation recipes

## Define REPO environment
```powershell
[System.Environment]::SetEnvironmentVariable('REPO_HOME', 'c:\source\repos', [System.EnvironmentVariableTarget]::User)
```

## Fix long path error
[Reference Thread Link](https://github.com/Microsoft/dotnet/issues/234#issuecomment-849373175):
Setting Enable Win32 long paths policy in Group Policy editor produced a working workaround.

1. Click the Window key and type gpedit.msc, then press the Enter key. This launches the _Local Group Policy Editor_
2. Navigate to _Local Computer Policy_ > _Computer Configuration_ > _Administrative Templates_ > _System_ > _Filesystem_
3. Double click on _Enable NTFS long paths_
Set the policy state to _Enabled_
4. Click _OK_
## Manual Pre-Installs
1. Google Chrome
2. 1Password
3. Box sync
4. Fix Taskbar setting manually

## Boxstarter / Chocolatey / Firewall / Network Discovery & Git
```powershell
Set-ExecutionPolicy Unrestricted -Scope Process -Force
```
```powershell
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/bootstrap.ps1'))
```

## Base Windows configuration
```powershell
Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/aamitabhinfra/psmodules/master/scripts/windows10-infra/tasks/base.ps1
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

## Post Manual Steps

   ### Enable Hyper-V VMs to have LAN network access
   See the link: [Share Your Network Connection with Hyper-V in Windows 10](https://www.groovypost.com/howto/share-an-ethernet-or-wireless-network-connection-with-hyper-v-in-windows-10/)
   ### Password-less Github access
   ```powershell
   ssh-keygen -t rsa -b 4096 -C "amitabh.arora@gmail.com"
   eval "$(ssh-agent -s)"
   cat ~/.ssh/id_rsa.pub | clip
   ....copy clipboard to github ...
   ```
   
   ### Windows Terminal
      Install from Windows Store

   ### Docker Desktop
   1. Install from Docker Hub
   2. Reboot
   3. Enable WSL integration
   
   ### WSL
   [Simplified Installation for Windows Insiders](https://docs.microsoft.com/en-us/windows/wsl/install-win10#simplified-installation-for-windows-insiders):
   1. Open an elevated command prompt
   2. Execute "```wsl --install```" command

   ### Miniconda3
   ``` powershell
   choco install miniconda3 -y --params="'/AddToPath:1'"
   ```

   ### Other manual application installs
   1. [JDK](https://www.oracle.com/java/technologies/downloads/)
   2. Capture NX 2, Capture NX-D
   3. dbpoweramp
   4. Epson Scan
   5. geosetter
   6. Harmony Remote
   7. Bandicam
   8. exiftool
   9. Microsoft Office
