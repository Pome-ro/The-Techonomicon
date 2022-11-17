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

$($ZenUsers.users | where { $_.tags -contains "" }).count
