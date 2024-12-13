# Deletes the given windows profile found in the filter between Get-CimInstance and RemoveCimInstance

$winProfile = "*profilename*"
Get-CimInstance -ClassName Win32_UserProfile | ? { $_.LocalPath -like $winProfile } | Remove-CimInstance -Confirm:$false