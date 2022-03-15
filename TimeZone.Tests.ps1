$be_computer = hostname
$MachineInfo = Get-ComputerInfo | select TimeZone 

Describe "TimeZone " {

    Context "Check Server TimeZone" {
    it "computername: TimeZone" {
    foreach ($i in $MachineInfo){
        if($i.TimeZone -ceq '(UTC-06:00) Central America'){
        $Result = 'Success'
        }else{
        $Result = 'Failed'
    }
}
    $Result -contains 'Success' | should be $true
        }
    }

}
