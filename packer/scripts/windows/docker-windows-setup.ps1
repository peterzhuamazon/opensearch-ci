# Enable Hyper-V
cmd.exe /c bcdedit /set hypervisorlaunchtype auto
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

# Enable Hyper-V Tools
Get-WindowsFeature Hyper*
Add-WindowsFeature Hyper-V-Tools
Add-WindowsFeature Hyper-V-PowerShell
