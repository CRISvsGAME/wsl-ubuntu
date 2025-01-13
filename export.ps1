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

    if (-Not "$Env:BackupsDir") {
        Write-Host "BackupsDir Variable Not Set in '$ConfigFile'"
        exit 1
    }

    if (-Not (Test-Path -Path "$Env:BackupsDir" -PathType Container)) {
        mkdir "$Env:BackupsDir"
    }

    $BackupsPath = Resolve-Path -Path "$Env:BackupsDir"
    $BackupsFile = Join-Path -Path "$BackupsPath" -ChildPath "$Env:Distro.tar"

    wsl --terminate "$Env:Distro"
    wsl --export "$Env:Distro" "$BackupsFile"

    Write-Host "Distro '$Env:Distro' Exported to '$BackupsFile'"
}
catch {
    Write-Host "Export Error: $($PsItem.Exception.Message)"
    exit 1
}
