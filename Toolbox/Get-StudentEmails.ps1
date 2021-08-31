

$SB = "OU=Students,OU=_Users,OU=_MPS,DC=mps,DC=mansfieldct,DC=net"
$Users = Get-ADUser -SearchBase $SB -Filter * -Properties EmployeeID, UserPrincipalName, enabled | Where-Object { $_.EmployeeID -ne $null } | Where-Object { $_.enabled -eq $true }
$CSV = $Users | Select-Object -Property EmployeeID, UserPrincipalName
$CSV | ConvertTo-CSV | Out-File ~\desktop\studentemail.csv
Get-ChildItem ~\desktop\studentemail.csv
start ~\desktop\studentemail.csv