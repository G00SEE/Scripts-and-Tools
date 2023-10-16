Get-ChildItem -Path 'C:\ProgramData\Identity Finder\MCData' | Remove-Item -Recurse -Force -Verbose
Get-ChildItem -Path 'C:\ProgramData\Identity Finder\Tasks' | Remove-Item -Recurse -Force -Verbose
Get-ChildItem -Path 'C:\ProgramData\IdentityFinder\boost_interprocess' | Remove-Item -Recurse -Force -Verbose

Restart-Service -Name 'identityfinderendpointservice'






