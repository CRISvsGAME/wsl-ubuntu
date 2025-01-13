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

    if (-Not "$Env:DistrosDir") {
        Write-Host "DistrosDir Variable Not Set in '$ConfigFile'"
        exit 1
    }

    if (-Not (Test-Path -Path "$Env:DistrosDir\$Env:Distro" -PathType Container)) {
        mkdir "$Env:DistrosDir\$Env:Distro"
    }

    $DistrosPath = Resolve-Path -Path "$Env:DistrosDir\$Env:Distro"
    $BackupsPath = Resolve-Path -Path "$Env:BackupsDir"
    $BackupsFile = Join-Path -Path "$BackupsPath" -ChildPath "$Env:Distro.tar"

    if (-Not (Test-Path -Path "$BackupsFile" -PathType Leaf)) {
        Write-Host "Backups File Not Found in '$BackupsFile'"
        exit 1
    }

    wsl --unregister "$Env:Distro"
    wsl --import "$Env:Distro" "$DistrosPath" "$BackupsFile"

    Write-Host "Distro '$Env:Distro' Imported to '$DistrosPath'"
}
catch {
    Write-Host "Export Error: $($PsItem.Exception.Message)"
    exit 1
}
