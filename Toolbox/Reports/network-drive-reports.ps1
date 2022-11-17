function Report-ShareFolder {
    [CmdletBinding()]
    param (
        # Specifies a path to one or more locations. Unlike the Path parameter, the value of the LiteralPath parameter is
        # used exactly as it is typed. No characters are interpreted as wildcards. If the path includes escape characters,
        # enclose it in single quotation marks. Single quotation marks tell Windows PowerShell not to interpret any
        # characters as escape sequences.
        [Parameter(Mandatory = $true,
            Position = 0,
            ParameterSetName = "LiteralPath",
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Literal path to one or more locations.")]
        [Alias("PSPath")]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $LiteralPath,
        [Parameter(Mandatory = $false,
            Position = 1,
            ParameterSetName = "LiteralPath",
            HelpMessage = "Output Path for CSV report on most used files")]
        [Alias("OutputDIR")]
        [ValidateNotNullOrEmpty()]
        [string]
        $OutputDirectory
    )

    begin {
        $rootPath = (Get-ChildItem -LiteralPath $LiteralPath).Directory[0].FullName
        Write-Host "Scanning $rootPath for contents..." -ForegroundColor Green
        # you have to \\ to split on \ because \ is an escape character.
        $parent = ($rootPath -split "\\")[-1]
        $subparent = ($rootPath -split "\\")[-2]
        $tree = Get-ChildItem -LiteralPath $LiteralPath -Recurse
    }

    process {
        $files = $tree | where { $_.Attributes -ne "Directory" }
        $fileTypeCount = foreach ($item in $($files.extension.tolower() | select -unique)) {
            $count = ($files.extension | where { $_ -eq $item } | measure-object).count
            [pscustomobject]@{
                name  = $item
                count = $count
            }
        }
        $top5Filetypes = $fileTypeCount | Sort-Object -Property count -Descending | Select-Object -First 5
        $folders = $tree | where { $_.Attributes -eq "Directory" }
        $accessedFiles = $files | Where { $_.LastAccessTime -gt $(Get-Date).AddMonths(-12) }
        $accesseCreatedInLastYear = $accessedFiles | Where { $_.CreationTime -gt $(Get-Date).AddMonths(-12) }
        $accessedFiles = foreach ($item in $accessedFiles) {
            if ([bool]($item.PSobject.Properties.name -match "owner")) {
                $item
            }
            else {
                $item | Add-Member -NotePropertyName owner -NotePropertyValue (Get-ACL $item.FullName).owner
                $item
            }
        }
        $changedFiles = $files | Where { $_.LastWriteTime -gt $(Get-Date).AddMonths(-12) }
        $changedFiles = foreach ($item in $changedFiles) {
            if ([bool]($item.PSobject.Properties.name -match "owner")) {
                $item
            }
            else {
                $item | Add-Member -NotePropertyName owner -NotePropertyValue (Get-ACL $item.FullName).owner
                $item
            }
        }
        $createdFiles = $files | Where { $_.CreationTime -gt $(Get-Date).AddMonths(-12) }
        $createdFilesModifiedAfter = $createdFiles | where { $_.LastWriteTime -gt $_.CreationTime }
        $createdFilesAccessedAfter = $createdFiles | where { $_.LastAccessTime -gt $_.CreationTime }
        $createdFiles = foreach ($item in $createdFiles) {
            if ([bool]($item.PSobject.Properties.name -match "owner")) {
                $item
            }
            else {
                $item | Add-Member -NotePropertyName owner -NotePropertyValue (Get-ACL $item.FullName).owner
                $item
            }
        }
        $createdorchangedFiles = ($changedFiles + $createdFiles) | Select-Object -Unique
        $createdFileTypeCount = foreach ($item in $($createdorchangedFiles.extension.tolower() | select -unique)) {
            $count = ($createdorchangedFiles.extension | where { $_ -eq $item } | measure-object).count
            [pscustomobject]@{
                name  = $item
                count = $count
            }
        }
        $top5CreatedFiletypes = $createdFileTypeCount | Sort-Object -Property count -Descending | Select-Object -First 5
        $activeUsers = $createdorchangedFiles.owner | Select-Object -Unique
        $activeUsers = foreach ($person in $activeUsers) {
            $obj = [PSCustomObject]@{
                name      = $person
                filecount = ($createdorchangedFiles | where { $_.owner -eq $person }).count
                $files    = $createdorchangedFiles | where { $_.owner -eq $person }
            }
            $obj
        }
        $consumedAuthers = $accessedFiles.owner | Select-Object -Unique
        $consumedAuthers = foreach ($person in $consumedAuthers) {
            $obj = [PSCustomObject]@{
                name      = $person
                filecount = ($accessedFiles | where { $_.owner -eq $person }).count
                $files    = $accessedFiles | where { $_.owner -eq $person }
            }
            $obj
        }

        $activeUsers = $activeUsers | Sort-Object -Property filecount -Descending
        $consumedAuthers = $consumedAuthers | Sort-Object -Property filecount -Descending
        write-host "[$subparent\$parent] $($files.count) files in $($folders.count) folders" -ForegroundColor Yellow
        write-host "[$subparent\$parent] Top 5 file types by quantity" -ForegroundColor Yellow
        write-host "    Type  Count"
        write-host "    -----------"

        foreach ($filetype in $top5Filetypes) {
            write-host "    $($filetype.name) $($filetype.count)"
        }
        write-host "[$subparent\$parent] Modify Activity" -ForegroundColor Yellow
        write-host "    $($changedFiles.count) files modified in the last 12 months."
        write-host "[$subparent\$parent] Access Activity" -ForegroundColor Yellow
        Write-Host "    $($accessedFiles.count) files accessed in the last 12 months."
        write-host "    $($accesseCreatedInLastYear.count) files accessed were created in the last 12 months."
        write-host "[$subparent\$parent] Creation Activity" -ForegroundColor Yellow
        write-host "    $($createdFiles.count) files created in the last 12 months."
        write-host "    $($createdFilesModifiedAfter.count) of files created were updated in the last 12 months."
        write-host "    $($createdFilesModifiedAfter.count) of files created were opened after their creation date."
        write-host "[$subparent\$parent] Top 5 active file types by quantity" -ForegroundColor Yellow
        write-host "    Type  Count"
        write-host "    -----------"
        foreach ($filetype in $top5CreatedFiletypes) {
            write-host "    $($filetype.name) $($filetype.count)"
        }
        write-host "[$subparent\$parent] $($activeUsers.count) Recent Editors\Creators:" -ForegroundColor Yellow
        foreach ($person in $activeUsers) {
            write-host "    $($person.name) owns $($person.filecount) files"
        }
        write-host "[$subparent\$parent] $($activeUsers.count) Recent Consumed Authers:" -ForegroundColor Yellow
        foreach ($person in $consumedAuthers) {
            write-host "    $($person.name) owns $($person.filecount) files"
        }

        if ($Null -ne $outputdirectory ) {
            $alltouchedfiles = $accessedFiles + $changedFiles + $createdFiles
            $alltouchedfiles = $alltouchedfiles | select -Unique
            $csvFileName = "$subparent-$parent-report.csv"
            $csvFilePath = Join-Path -Path $OutputDirectory -ChildPath $csvFileName
            $FileData = foreach ($item in $alltouchedfiles) {
                $obj = [PSCustomObject]@{
                    FileName       = $item.Name
                    Owner          = $item.Owner
                    ParentDIR      = ($item.DirectoryName -split '\\')[-1]
                    FullPath       = $item.FullName
                    CreationDate   = $item.CreationTime.ToString()
                    LastAccessDate = $item.LastAccessTime.ToString()
                    LastWriteDate  = $item.LastWriteTime.ToString()
                }
                $obj
            }
            $FileData | Export-CSV -NoTypeInformation -LiteralPath $csvFilePath
        }
    }

    end {

    }
}

$share = "\\path\to\network\share"

foreach ($dir in $share) {
    Report-ShareFolder -LiteralPath $dir -OutputDirectory "C:\users\pomeroyte\desktop\reports"
}

# Report-ShareFolder -LiteralPath $k4smartb
Write-Host ""
<#
foreach ($path in $rootShares) {
    $shares = Get-ChildItem $path
    Write-Host "Scanning $path for shares..." -ForegroundColor Green
    foreach ($share in $shares) {
        if ($share.BaseName -like "_User*" -or $share.BaseName -like "DesktopBackups") {
            # Write-Host "Skipping $($share.BaseName)" -ForegroundColor Yellow
        }
        else {
            Report-ShareFolder -LiteralPath $share.FullName
        }
        Write-Host ""
    }
}
#>