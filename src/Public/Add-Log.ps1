function Add-TextLog { 
    param(        
        [string]$Path, 
        [string]$value, 
        [ValidateSet("Informational", "Warning", "Error")]
        [string]$type,
        [switch]$timeSpan = $false, 
        [switch]$NoNewline = $false
    )    
    New-Item -Path $Path -Value "Test.txt"
    Add-Content -LiteralPath $file -Value $value -NoNewline:$NoNewline   
    Write-Host -NoNewline:$NoNewline "$value" 
}

function Add-HtmlLog { 
    param(        
        [string]$file, 
        [string]$value, 
        [ValidateSet("Informational", "Warning", "Error")]
        [string]$type,
        [switch]$timeSpan = $false, 
        [switch]$NoNewline = $false
    )    
    if ($timeSpan) { 
        $value = "$(Get-Date): $value" 
    }
    Add-Content -LiteralPath $file -Value $value -NoNewline:$NoNewline   
    Write-Host -NoNewline:$NoNewline "$value" 
}