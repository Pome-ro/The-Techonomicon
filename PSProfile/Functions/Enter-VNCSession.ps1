
function Enter-VNCSession {
    [cmdletbinding()]
    param(
        $ComputerName = ""
    )
    $LSR = "\\lansweeper.mansfieldct.net\lansweeper$\lsremote.exe"
    Start-Process -FilePath $LSR -ArgumentList $computername, "/NP"
}
