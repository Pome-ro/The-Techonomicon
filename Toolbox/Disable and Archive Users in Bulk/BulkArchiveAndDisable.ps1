<# ----OUTLINE----

    * Get list of users who are going to be disabled
    * Sometimes you don't always get their email, just a first/last name
    * Should be able to find them that way, gotta review the list though to make sure
    your not getting duplicates more then one result.

    * Use the GAM tool to archive the Google Drive account.
    * Have to archive the network drive, but can do that manually, kind of annoying
    working with windows permissions etc.

#>

$NameList =  Import-Csv $csvpath


foreach ($peson in $namelist) {
    $usr = Get-ADUser -Filter "givenName -eq $($person.givenName) -and Surname -eq $($person.Surname)"
    If($null -eq $user){
        $notProcessed += "$($person.givenName) $($person.Surname)"
    } else {
        Set-ADUser -Identity $usr -Description "[Disabled] $date $($cred.username)" -Credential $cred
        
        Disable-ADAccount -Identity $usr -Credential $cred
    }
}