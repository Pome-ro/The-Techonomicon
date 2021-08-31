$creds = Get-Credential
$URI = "https://mdm.mansfieldct.org:8443/api/v1/auth/token"
$Content = "application/json;charset=UTF-8"
$Token = Invoke-RestMethod -Method Post -Credential $creds -Authentication Basic -Uri $URI -ContentType $Content
$Token = $Token.token
$NewDeviceNames = Import-CSV -Path "~\desktop\Device Assignments - Combined.csv"
$URI = "https://mdm.mansfieldct.org:8443/api/v2/mobile-devices?page=0&page-size=631&sort=id%3Aasc"

$Headers = @{
    Authorization = "Bearer $Token"
}

$Devices = Invoke-RestMethod -Method GET -Headers $Headers -URI $URI -ContentType $Content
$DEVICES.totalCount
<#-------------------------------------------------------------------------#>
foreach ($newname in $NewDeviceNames) {


    $Device = $Devices.Results | Where-object { $_.SerialNumber -eq $newname.device_sn }
    $DeviceID = $Device.ID

    if ($null -ne $Device) {
        Write-Host "Found Entry: $($Device.serialNumber)"
        Write-Host "Device ID: $($DeviceID)"
    }
    else {
        Write-Host "Device Not Found: $($newname.device_sn)"
    }

    $URI = "https://mdm.mansfieldct.org:8443/api/v2/mobile-devices/$DeviceID"
    $BuildingID = switch ($newname.schoolid) {
        "GN" { 1 }
        "VN" { 2 }
        "SE" { 3 }
        Default {}
    }
    $Body = @{
        name     = $newname.device_tag
        location = @{
            buildingId = $BuildingID
            room       = $newname.home_room
        }
    }
    $Body = ConvertTo-Json $Body
    $body
    $SetName = Invoke-RestMethod -Method Patch -headers $Headers -URI $URI -ContentType $Content -Body $Body
    # Write-Host "$($Device.name) now named: $($SetName.name)"
}