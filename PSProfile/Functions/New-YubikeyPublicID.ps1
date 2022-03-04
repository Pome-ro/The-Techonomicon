function New-YubikeyPublicID {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter()]
        [int]
        $NumberOfKeys = 1
    )

    begin {
        $vv = "vv"
        $keysMade = 0
        $modhex = "c", "b", "d", "e", "f", "g", "h", "i", "j", "k", "l", "n", "r", "t", "u", "v"
    }

    process {
        while ($keysmade -lt $NumberOfKeys) {
            $curtimes = 0
            $times = 9
            $string = while ($curtimes -lt $times) {
                Get-Random $modhex
                $curtimes += 1
            }
            $key = $vv + $($string -join "")
            Write-Output $key
            $curtimes = 0
            $keysMade += 1
        }
    }

    end {

    }
}