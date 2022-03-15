
Describe "Windows Defender Features status" {

    Context "Checking Windows Defender Features" {
    it "Windows Defender Features is Off" {
    $wDFStatus = Get-WindowsFeature | where{$_.DisplayName -eq "Windows Defender Features"}
    $wDFStatus.Installed | should be 'False'
                                                }
                                   }

}