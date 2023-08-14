$Searchbase = "OU=2027,OU=MES Students,OU=Students,OU=Users,OU=_Mansfield Public Schools,DC=mps,DC=mansfieldct,DC=net"
$CSVPath = "~\desktop\5th-grade-passwords.csv"

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
Start-Process $CSVPath