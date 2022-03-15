$Domain = Get-WMIObject Win32_ComputerSystem| Select-Object -ExpandProperty Domain


Describe "DC Communication" {

    Context "Checking Communication" {
    it "Server is listening on Domain $Domain" {
    $Chek_Domian = Test-ComputerSecureChannel -Server $Domain
    $Chek_Domian | should be $true
                                                }
                                   }
}
