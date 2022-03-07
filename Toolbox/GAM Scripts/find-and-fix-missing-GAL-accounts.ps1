# use the command 'gam print users emails, creationtime, ou, suspended, gal > users.csv' to get the info you need to check
# for users not in the global address list

$users = Import-CSV -path .\users.csv  
$users = $users | where {$_.suspended -eq "False"} | where {$_.includeInGlobalAddressList -eq "False"}

foreach ($person in $users) {
    Write-Host "Updating $($person) GAL field to True..." -ForegroundColor Yellow
    gam update user $person gal True
}