Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
Write-Host "       System Information       "
Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

Write-Host ""

Write-Host "Computer Name:"
$env:COMPUTERNAME

Write-host ""

Write-Host "Current User:"
$env:USERNAME

Write-host ""

Write-Host "Current User:"
(Get-CimInstance Win32_OperatingSystem).Caption

Write-Host "Current User:"
(Get-CimInstance Win32_OperatingSystem).Version

Write-host ""

Write-Host "PowerShell Version:"
$PSVersionTable.PSVersion

Write-host ""

Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
Write-Host "             DISKS       "
Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

Get-Volume |
    Where-Object DriveLetter |
    Select-Object DriveLetter,
                  FileSystemLabel,
                  FileSystem,
                  SizeRemaining,
                  Size
