<#
  Remove fake python
  https://superuser.com/questions/1437590/typing-python-on-windows-10-version-1903-command-prompt-opens-microsoft-stor
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


if (Commands-Exist git,vim,python) {
  New-Item -ItemType Directory -Force -Path ~/git
  Push-Location -Path ~/git
  try {
    Write-Output "Installing vim configurations"

    git clone https://github.com/floh1695/vim
    Set-Location -Path vim
    python install.py

    Write-Output "Finished installing vim configurations"
  }
  catch {
    Write-Output "Failed to install vim configurations"
  }
  finally {
    Pop-Location
  }
}
