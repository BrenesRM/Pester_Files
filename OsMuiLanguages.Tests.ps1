$be_computer = hostname
$MachineInfo = Get-ComputerInfo | select OsMuiLanguages

Describe "OsMuiLanguages" {

    Context "Check Server OsMuiLanguages" {
    it "computername: OsMuiLanguages" {
    foreach ($i in $MachineInfo){
        if($i.OsMuiLanguages -ceq 'en-US'){
        $Result = 'Success'
        }else{
        $Result = 'Failed'
    }
}
    $Result -contains 'Success' | should be $true
        }
    }

}
