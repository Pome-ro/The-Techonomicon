$nextRoll = 0
$turnTimer = 1
$gameTimer = 1
$turnMax = 16
$gameMax = 1000
$runResults = @()

while ($gameTimer -ne $gameMax) {
    # Write-Host "Game $gameTimer - Turn $($turnTimer)!"
    $turnData = [PSCustomObject]@{
        game = $gameTimer
        turn = $turnTimer
        roll = 0
    }

    if ($nextRoll -le 0) {
        $nextRoll = Get-Random -Maximum 6 -Minimum 1
        # Write-Host "We rolled a $lastRoll"
        $turnData.roll = 1
    }

    $nextRoll += -1
    $runResults += $turnData
    $turnTimer += 1

    if ($turnTimer -gt $turnMax) {
        $gameTimer += 1
        $turnTimer = 1
        $nextRoll = 0
    }

}

$runResults | Export-Csv .\gamesim.csv
