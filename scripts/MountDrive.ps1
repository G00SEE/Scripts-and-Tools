
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "net use g: `'`\\web1\SHARES\New folder`' /user:web1\administrator Spirion2021"
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType Interactive 
$task = New-ScheduledTask -Action $action -Principal $principal
Register-ScheduledTask -TaskName "MapDriveAsSystemX" -InputObject $task
#Start-ScheduledTask -TaskName "MapDriveAsSystemX"
#Unregister-ScheduledTask -TaskName "MapDriveAsSystemX" -Confirm:$false