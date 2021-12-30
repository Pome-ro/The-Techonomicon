

#$SB = "OU=Students,OU=_Users,OU=_MPS,DC=mps,DC=mansfieldct,DC=net"
$Users = Get-ADUser -Filter * -Properties EmployeeNumber, EmployeeID, UserPrincipalName, enabled | Where-Object { $_.EmployeeID -ne $null } | Where-Object { $_.enabled -eq $true }
$Fixes = Import-Csv "~\desktop\all-doublecheck.csv"

$results = @()
foreach ($item in $Fixes) {
    $user = $users | Where-Object { $_.EmployeeNumber -eq $item.guid }
    $stuff = [PSCustomObject]@{
        student_number = $item.Student_Number
        psguid         = $item.guid
        adguid         = $user.employeeNumber
        goodemail      = $user.userprincipalname.ToLower()
        badmail        = $item.Email.ToLower()
    }
    if ($user -ne $null) {
        if ($user.userprincipalname.tolower() -eq $item.Email.ToLower()) {
        }
        else {
            <#
            write-host "Compairing $($user.employeeNumber) to $($item.guid)" -ForegroundColor Green
            write-host "email missmatch"
            write-host "ADEmail Email: $($user.userprincipalname.tolower())"
            #>
            if ($item.Email -ne "") {
                $results += $stuff

            }
        }
    }
    else {
        #Write-Host "user $($item.guid) not found"
    }
}

$results | format-table
#$results | ConvertTo-Csv | Out-File ~\desktop\mms-fixedemails.csv
#start ~\desktop\mms-fixedemails.csv
#$CSV = $Users | Select-Object -Property EmployeeID, UserPrincipalName
#$CSV | ConvertTo-CSV | Out-File ~\desktop\studentemail.csv
#Get-ChildItem ~\desktop\studentemail.csv
#start ~\desktop\studentemail.csv