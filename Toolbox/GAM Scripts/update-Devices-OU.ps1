<#
Notes:

This script intakes a list of devices and sets their OU either based on some variables or whatever is in the sheet.

#>

$RootOU = "/MPS Devices/"

$SchoolOU = @{
    VN     = "Vinton"
    SE     = "Southeast"
    GN     = "Goodwin"
    Loaner = "Loaner Devices"
}

#$CSV = "C:\users\pomeroyte\Desktop\Unassigneddevices.csv"
#$Devices = Import-Csv $CSV
$Devices =

$Devices.Count

$OU = $RootOU + $SchoolOU.Loaner

foreach ($SerialNumber in $Devices) {
    Write-Host "Moving " $Item "to $OU" -ForegroundColor Green
    $Query = "query:id:" + $SerialNumber

    ## Update Device OU
    #C:\gam\gam.exe update cros $Query ou $OU

    ## Disable Device
    #C:\gam\gam.exe gam update cros $Query action disable

    # Deprovision Device
    #C:\gam\gam.exe gam update cros $Query action deprovision_retiring_device acknowledge_device_touch_requirement


}