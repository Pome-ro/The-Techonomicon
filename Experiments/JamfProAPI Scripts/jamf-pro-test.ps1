$creds = Get-Credential
$URI = "https://mdm.mansfieldct.org:8443/api/v1/auth/token"
$Content = "application/json;charset=UTF-8"
$Token = Invoke-RestMethod -Method Post -Credential $creds -Authentication Basic -Uri $URI -ContentType $Content
$Token = $Token.token
$NewDeviceNames = Import-CSV -Path "~\downloads\2022 iPad Redistribution - Main Sheet.csv"
$URI = "https://mdm.mansfieldct.org:8443/api/v2/mobile-devices?page=0&page-size=631&sort=id%3Aasc"

$Headers = @{
    Authorization = "Bearer $Token"
}

$Devices = Invoke-RestMethod -Method GET -Headers $Headers -URI $URI -ContentType $Content
$DEVICES.totalCount
<#-------------------------------------------------------------------------#>
foreach ($newname in $NewDeviceNames) {
    Write-Host "Processing $($newname.device_sn)"

    $Device = $Devices.Results | Where-object { $_.SerialNumber -eq $newname.device_sn }
    $DeviceID = $Device.ID

    if ($null -ne $Device) {
        Write-Host "Processing Device $($newname.device_tag) - $($newname.device_sn)"
        if ($device.assetTag -ne $newname.device_tag) {
            Write-Host "Found Entry: $($Device.serialNumber)"
            Write-Host "Device ID: $($DeviceID)"
            Write-Host "Old Name: $($device.name)"
            Write-Host "New Name: $($newname.device_tag)"
            Write-Host "Location: $($newname.home_room)"

            Write-Host ""
            $URI = "https://mdm.mansfieldct.org:8443/api/v2/mobile-devices/$DeviceID"

            $Body = @{
                name     = $newname.device_tag
                assetTag = $newname.device_tag
                location = @{
                    room = $newname.home_room
                }
            }
            $Body = ConvertTo-Json $Body
            #$body
            $SetName = Invoke-RestMethod -Method Patch -headers $Headers -URI $URI -ContentType $Content -Body $Body
            Write-Host "$($Device.name) now named: $($SetName.name)"

        }
        else {
            Write-Host "Device Name already corrrect"
        }
    }
    else {
        Write-Host "Device Not Found: $($newname.device_sn)"
    }

}