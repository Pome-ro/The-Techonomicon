<#
    Just doing a naked Get-BitLockerVolume results in nearly good information.
    Except that KeyProtector (which lists the different keys for bitlocker) reports as a systemObject because of what is stored within.
    In order to accurately know if BitLocker is configured, but pending a restart, you need to know if there is anything stored within
    the KeyProtector AND know if the ProtectionStatus is "off". This (for now) gives a count of the keys, so you can at least compare
    between computers that have 0 keys and computers that have more then 0 keys.
#>

$BLinfo = Get-BitLockerVolume

$info = [PSCustomObject]@{
    ComputerName = $BLinfo.ComputerName
    MountPoint = $BLinfo.MountPoint
    EncryptionMethod = $BLinfo.EncryptionMethod
    AutoUnlockEnabled = $BLinfo.AutoUnlockEnabled
    AutoUnlockKeyStored = $BLinfo.AutoUnlockKeyStored
    MetadataVersion = $BLinfo.MetadataVersion
    VolumeStatus = $BLinfo.VolumeStatus
    ProtectionStatus = $BLinfo.ProtectionStatus
    LockStatus = $BLinfo.LockStatus
    EncryptionPercentage = $BLinfo.EncryptionPercentage
    WipePercentage = $BLinfo.WipePercentage
    VolumeType = $BLinfo.VolumeType
    CapacityGB = $BLinfo.CapacityGB
    KeyProtector = $BLinfo.KeyProtector.count
}

$info

