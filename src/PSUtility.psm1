Get-ChildItem -Path $PSScriptRoot\*.ps1  -Recurse | Foreach-Object{ . $_.FullName }

Export-ModuleMember -Function * -Alias *