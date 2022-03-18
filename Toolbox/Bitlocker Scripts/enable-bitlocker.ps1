<#
    Adds Bitlocker Protector for C:
    Stores Bitlocker password in AD
    Enables Bitlocker on device
#>

#add protector
manage-bde -protectors -add C: -rp

#get protector information
$output = manage-bde -protectors C: -get
#get protector ID
$id = $($($output | where-object { $_ -like "*ID:*" }) -split ":" -replace " ", "")[1]

#store the password in AD
manage-bde -protectors -adbackup C: -id $id

#turn on bitlocker for drive C
manage-bde -on C: