cd \
cd C:\salt\test\
$archivosAEliminar = Get-Content C:\salt\test\ArchivosAEliminar.txt

foreach ($i in $archivosAEliminar) {
$seEncuentra = Get-ChildItem -Recurse | Where {$_.Name -match $i}
    if ($seEncuentra) {
        write-host ("Prueba Unitaria eliminada: $i")
        Remove-Item -path "C:\salt\test\$i"
    }
}