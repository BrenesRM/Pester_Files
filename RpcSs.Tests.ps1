
Describe "RpcSs Status" {

    Context "Checking RpcSs" {
    it "RpcSs is On" {
    $nla = Get-Service -Name RpcSs
    $nla.Status | should be 'Running'
                                                }
                                   }
}