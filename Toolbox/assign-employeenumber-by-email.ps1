$Header = "ID", "TeacherNumber", "SchoolID", "Last_Name", "First_Name", "status", "email"
$teachers = Import-Csv -Path \\server\automation\teachers.csv -Header $Header
$teachers = $teachers | where { $_.status -eq 1 }
$cred = Get-Credential

$usersNotFound = @()
foreach ($teacher in $teachers) {
    $un = $teacher.email -split "@";
    if ($un -ne $null) {
        $username = $un[0]
        try {
            $adobj = get-aduser -Identity $username -Properties employeeNumber -Credential $cred;
            Set-ADObject -Identity $adobj -Replace @{employeeNumber = $teacher.TeacherNumber} -Credential
        }
        catch {
            $Teacher | Add-Member -NotePropertyName Username -NotePropertyValue $username
            $usersNotFound += $teacher
        }
    }
}

Write-Host "Exporting Users Not Found in AD"
$usersNotFound | Export-Csv -Path .\usersnotfound.csv -NoTypeInformation
