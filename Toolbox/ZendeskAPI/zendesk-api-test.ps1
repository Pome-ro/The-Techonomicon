#$Token = get-content ~\tokens\zendesk.token
$Token = Get-Content ~\tokens\zendesk.token
$Email = 'pomeroyte@mansfieldct.org'
$Auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$($Email)/token:$($Token)"))
$Content = "application/json;charset=UTF-8"
$Headers = @{
    Authorization = "Basic $Auth"
}

$URI = 'https://mansfieldit.zendesk.com/api/v2/users.json'

$ZenUsers = $null

$res = Invoke-RestMethod -Method GET -Headers $Headers -URI $URI -ContentType $Content
$ZenUsers += $res.users
do {
    $res = Invoke-RestMethod -Method GET -Headers $Headers -URI $res.next_page -ContentType $Content
    $ZenUsers += $res.users
} while (
    $res.next_page -ne $null
)

$UsersToFix = $ZenUsers | where { $_.user_fields.home_building -contains "building1" -or $_.user_fields.home_building -contains "building2" } | Select-Object -Property id, user_fields
Write-Host $UsersToFix.count
$body = @{}
$body.users = $UsersToFix | % { $_.user_fields.home_building = "building3"; $_ }
$Body = $body | ConvertTo-Json -Depth 5
$UpdateURI = "https://mansfieldit.zendesk.com/api/v2/users/update_many.json"


$Res = Invoke-RestMethod -Method PUT -Headers $Headers -URI $UpdateURI -ContentType $Content -Body $Body

$Res