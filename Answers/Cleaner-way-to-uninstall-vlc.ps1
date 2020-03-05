# Answer to question: https://www.reddit.com/r/PowerShell/comments/6idtex/shortercleaner_way_of_writing_this/

# Get all Uninstall items from the Reg store as pipeline variable.
$VLC_Uninstall = Get-ChildItem HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall -PipelineVariable p | 
# Get each entries properties
Get-ItemProperty | 
# Select the properties
Select-object @{Name="Path";Expression={$p.name}},Displayname,DisplayVersion,Publisher,InstallDate,InstallLocation,Comments,UninstallString | 
#Filter the list based on items display name.
Where-Object {$_.DisplayName -like "*VLC*"}

# Loop through the results
foreach($uninstall in $VLC_Uninstall){
    # Test to ensure the path is valid
    if(test-path $uninstall.uninstallstring){
        # Start the uninstall process silently
        Start-Process -FilePath $uninstall.uninstallstring -ArgumentList "/S"
    }
}