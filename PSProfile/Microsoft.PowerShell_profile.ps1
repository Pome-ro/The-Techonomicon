function trunk-path ($path) {
    $segments = $path.split('\')
    if ($segments.count -gt 4) {
        $segments = $path.split('\')
        $totalSegments = $segments.Length
        $Leaf = Split-Path -Path $path -Leaf
        $Qualifyer = Split-Path $path -Qualifier
        $Parent = $segments[$totalSegments - 2]
        $NewPath = $Qualifyer + "\" + ".." + "\" + $Parent + "\" + $Leaf
        $newPath
    }
    else {
        $path
    }
}


Import-Module posh-git
$currentFunctions = Get-ChildItem function:

$profile | add-member -Name "config" -MemberType NoteProperty -Value $psscriptroot\config.ps1
. $profile.config
Write-Host "♦♦ Loading Custom Functions" -ForegroundColor Yellow
$profile | add-member -name "functions" -MemberType NoteProperty -Value (Get-ChildItem function: | Where-Object { $currentFunctions -notcontains $_ })
Write-Host "♦♦ $($profile.functions.count) Custom Functions Loaded"  -ForegroundColor Yellow
Write-Host "♦♦ Type [Show-Functions] to list the Custom Functions"  -ForegroundColor Yellow

function Show-Functions {
    Write-Host $profile.functions.name -ForegroundColor Green
}

function prompt {
    $battery = Get-WmiObject win32_battery
    $batteryCharge = $battery.EstimatedChargeRemaining
    $batteryRunTime = [math]::Floor($battery.EstimatedRunTime / 3.6e+6)
    $backgroundColor = "DarkCyan"

    $curPath = Trunk-Path -path (Get-Location).Path


    write-host " ◊ " -NoNewline -ForegroundColor Yellow -BackgroundColor $backgroundColor
    write-host  $curPath -NoNewline -ForegroundColor Cyan -BackgroundColor $backgroundColor
    write-host " | " -NoNewline -ForegroundColor White -BackgroundColor $backgroundColor
    Write-Host "D " -NoNewline -ForegroundColor Yellow -BackgroundColor $backgroundColor
    Write-Host (Get-date -Format MM.dd.yy) -NoNewline -ForegroundColor Cyan -BackgroundColor $backgroundColor
    Write-Host " T " -NoNewline -ForegroundColor Yellow -BackgroundColor $backgroundColor
    Write-Host (Get-date -Format hh:mmtt) -NoNewline -ForegroundColor Cyan -BackgroundColor $backgroundColor
    write-host " | " -NoNewline -ForegroundColor White -BackgroundColor $backgroundColor
    Write-Host "B " -NoNewline -ForegroundColor yellow -BackgroundColor $backgroundColor
    Write-Host "[$batteryCharge%]▪ " -NoNewline -ForegroundColor Cyan -BackgroundColor $backgroundColor
    Write-Host "▼ " -NoNewline -ForegroundColor Yellow -BackgroundColor $backgroundColor
    Write-Host "$batteryRunTime hours" -NoNewline -ForegroundColor Cyan -BackgroundColor $backgroundColor


    Write-Host "▓▓▓▒▒▒░░" -ForegroundColor $backgroundColor

    write-host "[" -NoNewline -ForegroundColor yellow
    write-host $env:username.toupper() -NoNewline -ForegroundColor White
    write-host "@" -NoNewline -ForegroundColor Gray
    write-host $env:computername -NoNewLine -ForegroundColor White
    write-host "]" -NoNewLine -ForegroundColor Yellow
    write-host "::" -NoNewLine -ForegroundColor Yellow
    Return " "
}
