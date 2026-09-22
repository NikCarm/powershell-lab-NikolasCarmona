Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
Write-Host "       DISK SPACE CHECK       "
Write-Host "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

$volumes = Get-Volume |
           Where-Object DriveLetter

$volumes |
    Select-Object DriveLetter,
                  FileSystemLabel,
                  @{Name="FreeGB"; Expression={[math]::Round($_.SizeRemaining / 1GB, 2)}},
                  @{Name="TotalGB"; Expression={[math]::Round($_.Size / 1GB, 2)}},
                  @{Name="FreePercent"; Expression={[math]::Round(($_.SizeRemaining /$_.Size) * 100, 2)}}
foreach ($volume in $volumes) {

    $freePercent = ($volume.SizeRemaining / $volume.size) * 100

    if ($freePercent -lt 15) {
        Write-Warning "Drive $($volume.DriveLetter): has less than 15% space."
    }
}

