$Searchbase = "OU=2026,OU=OUstudents,OU=All-Users,OU=_MMS,DC=mps,DC=mansfieldct,DC=net"
$CSVPath = "~\desktop\NewPasswords-2.csv"

$Users = Get-ADUser -SearchBase $Searchbase -Filter * -Properties DisplayName, UserPrincipalName, EmployeeID

$Results = @()
foreach ($person in $users) {
    Write-Host $person.DisplayName
    $password = -join (((50..57) + (97..104) + (106..107) + (109..110) + (112..122))  | Get-Random -Count 8 | ForEach-Object { [char]$_ })
    $Data = [PSCustomObject]@{
        Name     = $person.DisplayName
        Email    = $person.UserPrincipalName
        ID       = $person.EmployeeID
        Password = $password
    }
    write-host $data
    $Results += $Data
}
$Results | ConvertTo-Csv | Out-File -FilePath $CSVPath