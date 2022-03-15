
$FreeSystemDriveMBytesThreshold = 5000
$FreeSystemDrivePctThreshold = .05
$FreeNonSystemDriveMBytesThreshold = 1000
$FreeNonSystemDrivePctThreshold = .05


describe 'Logical Disks' {

    $vols = Get-Volume | Where-Object { $_.DriveType -eq 'Fixed' -and -not [string]::IsNullOrEmpty($_.DriveLetter)}
    context 'Availablity' {
        $vols | ForEach-Object {
            it "Volume [$($_.DriveLetter)] is healthy" {
                $_.HealthStatus | Should be 'Healthy'
            }
        }
    }

    context 'Capacity' {
        $systemDriveLetter = $env:SystemDrive.Substring(0, 1)
        $sysVol = $vols | Where-Object DriveLetter -eq $systemDriveLetter
        $nonSysVols = $vols | Where-Object DriveLetter -NE $systemDriveLetter

        it "System drive [$systemDriveLetter] has $FreeSystemDriveMBytesThreshold MB and $('{0:p0}' -f $FreeSystemDrivePctThreshold) free" {
            ($sysVol.SizeRemaining / 1MB) -ge $FreeSystemDriveMBytesThreshold | Should be $true
            ($sysVol.SizeRemaining / $sysVol.Size) -ge $FreeSystemDriveThresholdPct | Should be $true
        }

        foreach ($volume in $nonSysVols) {
            $driveLetter = $volume.DriveLetter
            it "Non-System drive [$driveLetter] has greater than $FreeNonSystemDriveMBytesThreshold MB and $('{0:p0}' -f $FreeNonSystemDrivePctThreshold) free" {
                ($volume.SizeRemaining / 1MB) -ge $FreeNonSystemDriveThreshold | Should be $true
                ($volume.SizeRemaining / $volume.Size) -ge $FreeNonSystemDriveThresholdPct | Should be $true
            }
        }
    }
}
