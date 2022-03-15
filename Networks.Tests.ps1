$Network_Number = gwmi -query "Select IPAddress From Win32_NetworkAdapterConfiguration Where IPEnabled = True" | select IPAddress 
$json = $Network_Number | Convertto-Json
Describe "IP Network $json" {

    for($i=0; $i -le ($Network_Number.Count - 1); $i++){
        Context "Checking IP " {
        it "Networks $Network_Number[$i]" {
        foreach ($IP in $Network_Number ) {
        $IP | should Not BeNullOrEmpty
                                }
                        }

                              }

                                            }
}



