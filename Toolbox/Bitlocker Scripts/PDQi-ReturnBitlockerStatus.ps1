$BLinfo = Get-Bitlockervolume

if ($blinfo.ProtectionStatus -eq 'On' -and $blinfo.EncryptionPercentage -eq '100') {

    [PSCustomObject]@{
        EncryptedStatus = $True
        EncryptedDrive  = "C:"
    }

}
elseif ($blinfo.ProtectionStatus -eq 'Off') {
    [PSCustomObject]@{
        EncryptedStatus = $False
    }

}