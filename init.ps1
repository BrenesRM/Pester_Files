
cd \
cd salt\test
Invoke-Pester -Script @{ Path = './*.Tests.ps1' } -OutputFile Result_Test.xml -OutputFormat LegacyNUnitXml
.\MantenimientoPU.ps1
.\ScheduledTaskTrigger-LineaBase.ps1