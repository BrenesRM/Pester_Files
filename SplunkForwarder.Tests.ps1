$be_computer = hostname
$Remote_computer = '192.168.68.171'

Describe "SplunkForwarder Local Services" {

    Context "Check SplunkForwarder Local Port" {
    $Local_ports = @('8089')
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


    context 'Service SplunkForwarder Availability' {
    $Services = @('SplunkForwarder')
    foreach ($ServX in $Services){
            it "$ServX is running?" {
            $svc = Get-Service -Name $ServX
            $svc.Status | Should be running
                                    }

            }

     }

    Context "Check Remote Splunk Port" {
    $Local_ports = @('8089')
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
