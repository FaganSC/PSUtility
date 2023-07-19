<#
.SYNOPSIS
Connects to a given online service of Microsoft.
.DESCRIPTION
Connects to a given online service of Microsoft.
.PARAMETER Service
Specifies the service to connect to. May be a list of multiple services to use.
.INPUTS
None. You cannot pipe objects to Connect-MS365.
.EXAMPLE
Description: Connect to Microsoft Online
Connect-MS365 -Service MSOL
.EXAMPLE
Description: Connect to Microsoft Online and Exchange Online
Connect-MS365 -Service MSOL,EOL
.EXAMPLE
Description: Connect to SharePoint Online to connect to MyName-admin.sharepoint.com
Connect-MS365 -Service SPO -SPOOrgName MyName
.EXAMPLE
Description: Connect to Security and Compliance Center
Connect-MS365 -Service SCC
.EXAMPLE
Description: Connect to Azure ActiveDirectory  
Connect-MS365 -Service AAD
.EXAMPLE
Description: Connect to Microsoft Azure platform
Connect-MS365 -Service AZ
.EXAMPLE
Description: Connect to Microsoft Skype for Business Online service
Connect-MS365 -Service S4B
.LINK
https://fagansc.github.io/PSUtility
#>

function Copy-PSFile {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $True, Position = 1)]
        [string]$Path,
        [Parameter(Mandatory = $True, Position = 2)]
        [string]$Destination,
        [Parameter(Mandatory = $False, Position = 2)]
        [string]$Filter,
        [Parameter(Mandatory = $False, Position = 3)]
        [switch]$Recurse = $false,
        [Parameter(Mandatory = $False, Position = 3)]
        [switch]$RenameDuplicate = $false
    )

    <#
    .SYNOPSIS
    Connects to Microsoft Azure ActiveDirectory (AzureAD / AAD) service.
    .DESCRIPTION
    Connects to Microsoft Azure ActiveDirectory (AzureAD / AAD) service.
    .PARAMETER Credential
    PSCredential object containing user credentials.
    .INPUTS
    None. You cannot pipe objects to Add-Extension.
    .OUTPUTS
    // <OBJECTTYPE>. TBD.
    .EXAMPLE
    PS> Connect-AAD -Credential $Credential
    .LINK
    http://github.com/blindzero/Connect-MS365
    #>
    
    if (Test-Path -PathType Leaf -Path $Path) { 
        $item = Get-Item -Path $path
        $destinationLocation = "$($Destination)\$($item.Name)"
        if (-not $RenameDuplicate -and (Test-Path -PathType Leaf -LiteralPath $destinationLocation)) {
            do {
                $confirm = Read-Host -Prompt "Replace existing file (Y/N)?"
            } until ($confirm.ToUpper() -eq "Y" -or $confirm.ToUpper() -eq "N")
            if ($confirm.ToUpper() -eq "Y") {
                $RenameDuplicate = $True
            }
        }

        if ($RenameDuplicate) {
            if (Test-Path -PathType Leaf -LiteralPath $destinationLocation) {
                $fileCounter = 1
                do {
                    $newFileName = "$($item.BaseName) ($fileCounter)$($item.Extension)"
                    $destinationLocation = "$($Destination)\$($newFileName)"
                    $fileFound = Test-Path -PathType Leaf -LiteralPath $destinationLocation
                    $fileCounter++
                } until (-not $fileFound)
            }
            Write-Host -NoNewline "Copying File $($item.Name) as $newFileName"
        } else {
            Write-Host -NoNewline "Copying File $($item.Name)"
        }

        try {
            Copy-Item -Path $Path -Destination $destinationLocation -Filter $Filter
            Write-Host -ForegroundColor Green " .....Completed"
        }
        catch {
            Write-Host -ForegroundColor Red " .....Error"
            Write-Error $_.Exception
        }
    }
    else {
        Write-Host "Path parameter is not a file"
    }
}

Export-ModuleMember -Function Copy-PSFile