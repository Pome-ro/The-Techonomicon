Function Get-FolderSize {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)] $FolderPath
    )
    $items = @()
    If ( ( Test-Path $FolderPath ) -and (Get-Item $FolderPath).PSIsContainer ) {
        Get-ChildItem -Path $FolderPath -Recurse -ErrorAction SilentlyContinue  | ForEach-Object {
            $size = (Get-ChildItem -File -Path $_.FullName | Measure-Object -Property Length -Sum).Sum
	    $unit = "B"
	switch ($size) {
		{$_ -ge 1000 -and $_ -lt [MATH]::Pow(1000,2)} {$size = $size / 1KB; $unit = "KB"}
		{$_ -ge [MATH]::Pow(1000,2) -and $_ -lt [MATH]::Pow(1000,3)} {$size = $size / 1MB; $unit = "MB"}
		{$_ -ge [MATH]::Pow(1000,3)} {$size = $size / 1GB;$unit = "GB"}
	}
	$items += [PSCustomObject]@{
                Folder = $_.FullName
                Size = $size
		Unit = $unit
            }
        }
    }
    $items | sort -Property {$_.size / 1KB}
}
