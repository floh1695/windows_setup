<#
  Run manually first.
  1. `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`
#>


$ScriptDirectory = Split-Path `
  -Path $MyInvocation.MyCommand.Definition `
  -Parent

try {
    . ("$ScriptDirectory\include.ps1")
}
catch {
    Write-Host "Error importing ./include.ps1" 
}


if (Command-Not-Exists choco) {
  <# Install Chocolatey (https://chocolatey.org/install#individual) #>

  Write-Output "Installing choco"

  Set-ExecutionPolicy Bypass -Scope Process -Force

  [System.Net.ServicePointManager]::SecurityProtocol = `
    [System.Net.ServicePointManager]::SecurityProtocol `
    -bor 3072

  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

  Write-Output "Installed choco"
}


if (Command-Exists choco) {
  if (Command-Not-Exists git) {
    choco install git
    choco install poshgit
  }

  if (Command-Not-Exists vim) {
    choco install vim
  }

  if (Command-Not-Exists python3) {
    choco install python3
  }

  if (Command-Not-Exists conhost) {
    choco install microsoft-windows-terminal
  }

  if (Command-Not-Exists code) {
    choco install vscode
  }

  if (Command-Not-Exists node) {
    choco install nodejs
  }

  if (Command-Not-Exists dotnet) {
    choco install dotnetcore-sdk
  }

  if (Command-Not-Exists gcc) {
    choco install mingw
  }
}
