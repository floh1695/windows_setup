Function Command-Exists {
  [OutputType([Bool])]
  Param(
    [String] $Command
  )

  [Bool](Get-Command -Name $Command -ea 0)
}

Function Command-Not-Exists {
  [OutputType([Bool])]
  Param(
    [String] $Command
  )

  return -Not (Command-Exists $Command)
}

Function Commands-Exist {
  [OutputType([Bool])]
  Param(
    [String[]] $Commands
  )

  $exists = $True
  foreach ($command in $Commands)
  {
    $commandExists = Command-Exists $command
    $exists = ($exists) -And ($commandExists)
  }

  return $exists
}
