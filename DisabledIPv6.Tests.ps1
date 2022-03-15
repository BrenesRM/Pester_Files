
Describe "Disabled IPv6" {

    Context "Checking IPv6" {
    it "IPv6 is Disabled" {
    $IPv6 = Get-NetAdapterBinding -ComponentID ms_tcpip6 | select Enabled
    $State = $IPv6.ForEach('Enabled').contains('True')
    $State | should be 'False'
                                                }
                                   }
}