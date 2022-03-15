$be_computer = hostname

Describe "McAffe Local Services" {

    Context "Check McAffe Local Port" {
    $Local_ports = @('445')
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


    context 'Service McAffe Availability' {
    $Services = @('masvc')
    foreach ($ServX in $Services){
            it "$ServX is running?" {
            $svc = Get-Service -Name $ServX
            $svc.Status | Should be running
                                    }

            }

     }

}
