$be_computer = hostname
$Remote_computer = 'bc-adsst-102.central.bccr.fi.cr'

Describe "Salt-minion Local Services" {

    Context "Check Salt-minion Local Port" {
    $Local_ports = @('4510', '4511')
    foreach ($port in $Local_ports) {
        it "Server is listening on port $port" {
            $port_state = Invoke-Command -computer $be_computer `
            -ScriptBlock {param($port)(Get-NetTCPConnection -LocalPort $port `
            -ErrorAction SilentlyContinue).State} `
            -ArgumentList $port
            $port_state.Value -contains "Listen" | should be $true
                                                }
                                   }
                                    
                          }


    context 'Service Salt-minion Availability' {
    $Services = @('salt-minion')
    foreach ($ServX in $Services){
            it "$ServX is running?" {
            $svc = Get-Service -Name $ServX
            $svc.Status | Should be running
                                    }

            }

     }

    Context "Check Remote SaltMaster Port" {
    $Local_ports = @('4505', '4506')
    foreach ($port in $Local_ports) {
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
