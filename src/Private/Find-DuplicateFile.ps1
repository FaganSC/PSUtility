function Find-DuplicateFile {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,Position=1)]
        [String]
        $destination
    )
    if (Test-Path -LiteralPath $destination) {
        $fileCounter = 1
        do {
            $destinationLocation = "$($Destination)\$($item.BaseName) ($fileCounter)$($item.Extension)"
            $fileFound = Test-Path -LiteralPath $destinationLocation
            $fileCounter++
        } until (-not $fileFound)
    }
    return $Location
}