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

function Set-NewLog {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $False, Position = 1)]
        [String[]]$Path,
        [Parameter(Mandatory = $False, Position = 1)]
        [String[]]$Destination,
        [Parameter(Mandatory = $False, Position = 1)]
        [Switch]$RenameDuplicate
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

    Set-TestPrivate -Message "Testing 1234"
}

Export-ModuleMember -Function Set-NewLog