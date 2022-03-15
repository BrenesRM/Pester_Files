
Describe "RDP NLA" {

    Context "Checking RDP NLA" {
    it "RDP NLA is Off" {
    $nla = (Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices -ComputerName localhost -Filter "TerminalName='RDP-tcp'").UserAuthenticationRequired
    $nla | should be '0'
                                                }
                                   }

}