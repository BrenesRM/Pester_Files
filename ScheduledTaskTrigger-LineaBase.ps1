﻿$Trigger= New-ScheduledTaskTrigger -At 2:00am –Daily # Specify the trigger settings
$User= "NT AUTHORITY\SYSTEM" # Specify the account to run the script
$Action= New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "C:\salt\test\init.ps1" # Specify what program to run and with its parameters
Register-ScheduledTask -TaskName "Testing - Linea Base" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force # Specify the name of the task


