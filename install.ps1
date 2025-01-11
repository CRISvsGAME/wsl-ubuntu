try {
    $ConfigFile = Join-Path -Path "$PSScriptRoot" -ChildPath "config.ps1"

    if (-Not (Test-Path -Path "$ConfigFile" -PathType Leaf)) {
        Write-Host "Config File Not Found in '$ConfigFile'"
        exit 1
    }

    . "$ConfigFile"

    if (-Not "$Env:Distro") {
        Write-Host "Distro Variable Not Set in '$ConfigFile'"
        exit 1
    }

    wsl --install "$Env:Distro"
}
catch {
    Write-Host "Install Error: $($PsItem.Exception.Message)"
    exit 1
}
