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

## Export

### PowerShell

```powershell
powershell -ExecutionPolicy Bypass -File "export.ps1"
```

## Import

### PowerShell

```powershell
powershell -ExecutionPolicy Bypass -File "import.ps1"
```
