# WSL Ubuntu

## Config

### config.ps1

```powershell
$Env:Distro = "Ubuntu"
$Env:BackupsDir = "C:\WSL\Backups"
$Env:DistrosDir = "C:\WSL\Distros"
```

## Install

### PowerShell

```powershell
powershell -ExecutionPolicy Bypass -File "install.ps1"
```
