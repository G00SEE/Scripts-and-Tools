﻿$path = 'C:\Users\Administrator\Desktop'
Get-ChildItem $path -recurse | where-object {$_.length -gt 33554432} | Select-Object -Property Name, length | Export-Csv -Path "C:\users\Administrator\desktop\filesGT32MB.csv" -NoTypeInformation