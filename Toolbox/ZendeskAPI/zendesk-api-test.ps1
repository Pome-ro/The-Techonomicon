#$Token = get-content ~\tokens\zendesk.token
$Token = Get-Content ~\tokens\zendesk.token
$Email = 'pomeroyte@mansfieldct.org'
$Auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$($Email)/token:$($Token)"))
$Content = "application/json;charset=UTF-8"
$Headers = @{
    Authorization = "Basic $Auth"
}

$URI = 'https://mansfieldit.zendesk.com/api/v2/users.json'

$ZenUsers = Invoke-RestMethod -Method GET -Headers $Headers -URI $URI -ContentType $Content
$UsersToFix = $ZenUsers.users | where { $_.user_fields.home_building -contains "Building1" -or $_.user_fields.home_building -contains "Building2" } | Select-Object -Property id, user_fields
$body = @{}
$body.users = $UsersToFix | % { $_.user_fields.home_building = "Building3"; $_ }
$Body = $body | ConvertTo-Json -Depth 5
$UpdateURI = "https://mansfieldit.zendesk.com/api/v2/users/update_many.json"


$Res = Invoke-RestMethod -Method PUT -Headers $Headers -URI $UpdateURI -ContentType $Content -Body $Body

$Res