$Config = Import-PowerShellDataFile -Path $PSScriptRoot\config.psd1
$Data = Import-Csv -Path $(Join-Path -Path $Config.Datasheet.Name -ChildPath $Config.Datasheet.Path)

foreach ($Entry in $Data) {
    $templateUser = Get-ADUser $Entry.CurrentStaffMember -Properties *
    $newStaffName = "$($Entry.NewStaffLastName), $($Entry.NewStaffFirstname)"
    $newStaffUserName = $($Entry.NewStaffLastName + $($NewStaffFirstName[0])).tolower()
    $newStaffPassword = ConvertTo-SecureString -String $Entry.NewStaffTempPassword -Force -AsPlainText
    New-ADUser -Name $newStaffName -SamAccountName $newStaffUserName -AccountPassword $newStaffPassword -ChangePasswordAtLogon $True -Instance $user
}

$cred = Get-Credential
$user = Get-ADUser pomeroyte -Properties MemberOf,
New-ADUser -Name 'Adam Blorgborg' -SamAccountName "BlorgborgA" -UserPrincipalName "blorgborgA@mansfieldct.org" -Instance $user -Credential $cred

$templateUser = Get-ADUser Pomeroyte -Properties *
$newUser = Get-ADUser 'Adam Blorgborg' -Properties *

foreach ($property in $newUser.PSObject.Properties) {
    $matchingTemplateUserProperty = $templateUser.PSObject.Properties | Where-Object { $_.Name -eq $property.Name }
    if ($matchingTemplateUserProperty.Value -ne $property.Value) {
        Write-Host "The [$($property.Name) attribute is different]"
    }
}