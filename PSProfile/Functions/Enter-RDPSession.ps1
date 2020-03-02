function Enter-RDPSession {
    [CmdletBinding()]
    param (
        # ComputerName
        [Parameter(Mandatory)]
        [String]
        $ComputerName = ""
    )

    begin {
        Start-Process "$env:windir\system32\mstsc.exe" -ArgumentList "/v:$computername"
    }

    process {

    }

    end {

    }
}