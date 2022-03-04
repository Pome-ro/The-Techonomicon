function Remove-ADUserFromGroup {
    [CmdletBinding()]
    param (
        [Parameter(mandatory)]
        [string]
        $identity,
        [Parameter(mandatory)]
        [securestring]
        $credential
    )
    $ADUser = Get-ADUser $identity -Properties memberof
    $Selections = (($ADUser).memberof | Get-ADGroup) | Select Name, GroupCategory, GroupScope | Sort-Object Name
    Write-Host "Select Group to remove."
    Write-Host "----------------------"
    ForEach ($Thing in $Selections) {
        $index = [array]::indexof($selections, $Thing)
        Write-Host "$index) $($Thing.Name)"
    }
    Write-Host "Q) QUIT"
    $Choice = Read-Host "Please make a selection"

    if ($choice -eq 'Q') {
        return
    }
    elseif ($choice -ne $null) {
        Write-Host "You are about to remove $($aduser.name) from the group $($selections[$choice].name)" -ForegroundColor Red
        Write-Host "Do you wish to proceed?" -ForegroundColor Red
        Write-Host "Y) Yes"
        Write-Host "N) No"
        $Confirm = Read-Host "Please make a selection"
        switch ($confirm) {
            "Y" { Remove-ADGroupMember -Identity $($Selections[$choice].Name) -Members $ADUser -Credential $cred }
            "N" { Return }
            Default { Return }
        }
    }
    else {
        return
    }
}
