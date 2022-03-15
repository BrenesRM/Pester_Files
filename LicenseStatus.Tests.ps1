$Remote_computer = '192.168.68.52'

Describe "LicenseStatus" {

    Context "Checking LicenseStatus" {
    it "Server is License" {
    $Lic = Get-CimInstance -ClassName SoftwareLicensingProduct | where {$_.productkeyid} | SELECT LicenseStatus
    $Lic.LicenseStatus | should be '1'
                                                }
                                   }

    Context "Check Remote KMS Port" {
    $Remote_ports = @('1688')
    foreach ($port in $Remote_ports) {
        $socket = New-Object Net.Sockets.TcpClient
        it "Server is listening on port $port" {
            Try{
                $socket.Connect($Remote_computer, $port)
                $Result = 'Success'
            }
            Catch{
                Write-Host $_
                $Result = 'Failed'
            }
            Finally{
                $socket.Close()
                $socket.Dispose()
            }
            $Result -contains 'Success' | should be $true
                                                }
                                   }
                                    
                          }
}