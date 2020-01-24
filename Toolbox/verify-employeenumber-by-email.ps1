$Header = "ID", "TeacherNumber", "SchoolID", "Last_Name", "First_Name", "status", "email"
$teachers = Import-Csv -Path \\server\automation\teachers.csv -Header $Header
$teachers = $teachers | where { $_.status -eq 1 }
$cred = Get-Credential

$matchDetails = @()
foreach ($teacher in $teachers) {
    $un = $teacher.email -split "@";
    if ($un -ne $null) {
        $username = $un[0]
        try {
            $adobj = get-aduser -Identity $username -Properties employeeNumber;
            if ($teacher.TeacherNumber -eq $adobj.EmployeeNumber) {
                $Teacher | Add-Member -NotePropertyName Match -NotePropertyValue True
                $Teacher | Add-Member -NotePropertyName ADEmployeeNumber -NotePropertyValue $adobj.EmployeeNumber
                $matchDetails += $Teacher
            }
            else {
                $Teacher | Add-Member -NotePropertyName Match -NotePropertyValue False
                $Teacher | Add-Member -NotePropertyName ADEmployeeNumber -NotePropertyValue $adobj.EmployeeNumber
                $matchDetails += $Teacher
            }
        }
        catch {

        }
    }
}

$usersNotFound | Export-Csv -Path .\userVerificationResults.csv -NoTypeInformation