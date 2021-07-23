<#
Notes:

This script intakes a list of devices and sets their OU either based on some variables or whatever is in the sheet.

#>

$RootOU = "/MPS Devices/"

$SchoolOU = @{
    VN = "Vinton"
    SE = "Southeast"
    GN = "Goodwin"
    CD = "ChromeDiag"
}

#$CSV = "C:\users\pomeroyte\Desktop\Unassigneddevices.csv"
#$Devices = Import-Csv $CSV
$Devices = "list",
"of",
"serialnumbers",

$Devices.Count

$OU = $RootOU + $SchoolOU.CD

foreach ($item in $Devices) {
    Write-Host "Moving " $Item "to $OU" -ForegroundColor Green
    $SerialNumber = "query:id:" + $item
    C:\gam\gam.exe update cros $SerialNumber ou $OU
}