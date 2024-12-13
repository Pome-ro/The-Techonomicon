$newpasswords = import-csv "~\desktop\newfithgradepasswords23-24.csv"
$creds = Get-Credential
$OU = "OU=2027,OU=OUstudents,OU=All-Users,OU=_MMS,DC=mps,DC=mansfieldct,DC=net"


Foreach ($item in $newpasswords) {
    $ADUser = Get-ADUser -filter "userprincipalname -eq '$($item.Email)'" -Properties EmployeeID, SamAccountName, userprincipalname
    Write-Host "ADUser: $($aduser.userprincipalname)" -ForegroundColor Green
    Write-Host "User In Sheet: $($item.Email)" -ForegroundColor Green
    Write-Host "Setting password to $($item.password)" -ForegroundColor Green
    Set-ADAccountPassword -Identity $ADUser -NewPassword $(ConvertTo-SecureString -String $item.Password -AsPlainText) -Credential $creds
    Move-ADObject -Identity $ADUser -TargetPath $OU -Credential $creds
    Write-host ""
}