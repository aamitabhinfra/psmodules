# Hyper-V Helper Module

```powershell
Import-Module D:\data\source\repos\infra\psmodules\AmitabhCoHyperV -Force
New-AcoVM -name basewin10 -ram 16GB -cpu 4 -iso "C:\Local\VMs\Images\Windows 10.iso"
```