
Describe "Firewall" {

    Context "Checking Firewall" {
    it "Firewall is Off" {
    $Firewall = invoke-command -computername localhost  -scriptblock {
    try{ get-netfirewallprofile | select name,enabled }
    catch{ netsh advfirewall show all state }
    }
    $State = $Firewall.Contains('True')
    $State | should be 'False'
                                                }
                                   }
}