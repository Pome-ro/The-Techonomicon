function Get-StringHash {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string[]]
        $String,
        [Parameter(Mandatory)]
        [string]
        $Algorithm
    )
    foreach ($item in $string) {
        $stream = [IO.MemoryStream]::new([byte[]][char[]]$item);
        $hash = Get-FileHash -InputStream $stream -Algorithm $Algorithm;
        $result = [PSCustomObject]@{
            Hash   = $hash.Hash
            String = $item
        }
        write-output $result
    }
}

Get-StringHash -String "01-12-2023-Gmail Phishing Attack" -Algorithm "SHA1"