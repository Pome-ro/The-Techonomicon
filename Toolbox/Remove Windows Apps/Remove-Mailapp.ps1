# Removes the Mail App from PCs
$Mail = Get-AppxPackage -allusers *microsoft.windowscommunicationsapps*

If ($Mail -ne $null) {
    Write-Host "Removing Mail App"
    $Mail | Remove-AppxPackage
} else {
    Write-Host "Mail App Not Found"
}
