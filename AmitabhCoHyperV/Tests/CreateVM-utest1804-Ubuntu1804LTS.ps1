Import-Module AmitabhCoHyperV -Force

New-AcoVM -name utest1804 -cpu 1 -ram 4GB -iso "Y:\Software\OS\Ubuntu\ubuntu-18.04.4-desktop-amd64.iso"

# To change resolution
#   sudo vi /etc/default/grub
#   replace string video=hyperv_fb: 1920×1280
#   sudo update-grub
#   reboot