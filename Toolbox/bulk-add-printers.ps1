$printersCSV = @"
"@

$printers = $printersCSV | ConvertFrom-Csv
$server = ""
$driver = ""
$loc = ""
foreach ($item in $printers) {
    Set-Printer -ComputerName $server -Name $item.name -ShareName $item.name -DriverName $driver -Location $loc -PortName $item.IP -Verbose
}