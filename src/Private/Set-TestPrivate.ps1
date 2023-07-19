function Set-TestPrivate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false,Position=1)]
        [String]
        $Message
    )
    Write-Host "Testing Private - $($Message)"
}