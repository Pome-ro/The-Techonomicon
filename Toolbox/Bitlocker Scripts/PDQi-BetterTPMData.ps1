$GTPM = Get-Tpm
$CTPM = Get-CimInstance -Namespace root/CIMV2/Security/MicrosoftTpm -ClassName Win32_Tpm

$TPMStatus = [PSCustomObject]@{
    ComputerName       = $env:COMPUTERNAME
    TpmPresent         = $GTPM.TpmPresent
    TpmReady           = $GTPM.TpmReady
    TpmEnabled         = $GTPM.TpmEnabled
    TpmActivated       = $GTPM.TpmActivated
    TpmOwned           = $GTPM.TpmOwned
    RestartPending     = $GTPM.RestartPending
    ManagedAuthLevel   = $GTPM.ManagedAuthLevel
    OwnerClearDisabled = $GTPM.OwnerClearDisabled
    AutoProvisioning   = $GTPM.AutoProvisioning
    LockedOut          = $GTPM.LockedOut
    ScanDate           = $(Get-Date)
}

if ($CTPM -eq $Null) {
    $TPMStatus | Add-Member -NotePropertyName ManufacturerId -NotePropertyValue "N/A"
    $TPMStatus | Add-Member -NotePropertyName ManufacturerIdTxt -NotePropertyValue "N/A"
    $TPMStatus | Add-Member -NotePropertyName ManufacturerVersion -NotePropertyValue "N/A"
    $TPMStatus | Add-Member -NotePropertyName ManufacturerVersionInfo -NotePropertyValue "N/A"
    $TPMStatus | Add-Member -NotePropertyName ManufacturerVersionFull20 -NotePropertyValue "N/A"
    $TPMStatus | Add-Member -NotePropertyName LockoutHealTime -NotePropertyValue "N/A"
    $TPMStatus | Add-Member -NotePropertyName LockoutCount -NotePropertyValue "N/A"
    $TPMStatus | Add-Member -NotePropertyName LockoutMax -NotePropertyValue "N/A"
    $TPMStatus | Add-Member -NotePropertyName SelfTest -NotePropertyValue "N/A"
    $TPMStatus | Add-Member -NotePropertyName PhysicalPresenceVersionInfo -NotePropertyValue "N/A"
    $TPMStatus | Add-Member -NotePropertyName SpecVersion -NotePropertyValue "N/A"
}
else {
    $TPMStatus | Add-Member -NotePropertyName ManufacturerId -NotePropertyValue $GTPM.ManufacturerId
    $TPMStatus | Add-Member -NotePropertyName ManufacturerIdTxt -NotePropertyValue $GTPM.ManufacturerIdTxt
    $TPMStatus | Add-Member -NotePropertyName ManufacturerVersion -NotePropertyValue $GTPM.ManufacturerVersion
    $TPMStatus | Add-Member -NotePropertyName ManufacturerVersionInfo -NotePropertyValue $CTPM.ManufacturerVersionInfo
    $TPMStatus | Add-Member -NotePropertyName ManufacturerVersionFull20 -NotePropertyValue $GTPM.ManufacturerVersionFull20
    $TPMStatus | Add-Member -NotePropertyName LockoutHealTime -NotePropertyValue $GTPM.LockoutHealTime
    $TPMStatus | Add-Member -NotePropertyName LockoutCount -NotePropertyValue $GTPM.LockoutCount
    $TPMStatus | Add-Member -NotePropertyName LockoutMax -NotePropertyValue $GTPM.LockoutMax
    $TPMStatus | Add-Member -NotePropertyName SelfTest -NotePropertyValue $GTPM.SelfTest
    $TPMStatus | Add-Member -NotePropertyName PhysicalPresenceVersionInfo -NotePropertyValue $CTPM.PhysicalPresenceVersionInfo
    $TPMStatus | Add-Member -NotePropertyName SpecVersion -NotePropertyValue $CTPM.SpecVersion
}

$SecureBootStatus = try {
    if (Confirm-SecureBootUEFI) {
        Write-Output "Enabled"
    }
    else {
        Write-Output "Disabled"
    }
}
catch {
    $_.Exception.Message
}

$TPMStatus | Add-Member -NotePropertyName "UEFISecureBootStatus" -NotePropertyValue $SecureBootStatus

$TPMStatus