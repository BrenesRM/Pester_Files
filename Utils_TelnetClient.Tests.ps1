
Describe "Telnet Client Installed" {

    Context "Checking Telnet Client" {
    it "Telnet Client is Installed" {
    $telnetStatus = Get-WindowsFeature telnet-client | select Installed
    $telnetStatus.Installed | should be 'True'
                                                }
                                   }
}