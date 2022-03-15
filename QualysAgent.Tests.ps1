$be_computer = hostname
$Remote_computer = 'bc-moqgw-101'

Describe "Local QualysAgent Services" {

    Context "Check QualysAgent Local Port" {
    $Local_ports = @('135')
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


    context 'Service QualysAgent Availability' {
    $Services = @('QualysAgent')
    foreach ($ServX in $Services){
            it "$ServX is running?" {
            $svc = Get-Service -Name $ServX
            $svc.Status | Should be running
                                    }

            }

     }

    Context "Check Remote Qualys Port" {
    $Local_ports = @('8080')
    foreach ($port in $Local_ports) {
        $socket = New-Object Net.Sockets.TcpClient
        it "Remote Server is listening on port $port" {
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
