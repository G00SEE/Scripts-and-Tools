#notes#
#add the new license file to a folder on a file share that will be accessible for copying to the agent machines.
#ensure that the name of the license file is "identityfinder.lic"
#ensure that the account used to run this script has access to the target folder below "C:\Program Files (x86)\Spirion", and the source folder to copy the license file. 

$LicSource = "C:\Users\Administrator\Downloads\SourceLic\"
Copy-Item -Path $LicSource -Destination 'C:\Program Files (x86)\Spirion\' -Force

Stop-Service -Name 'IdentityFinderEndpointService' -Force -ErrorAction Ignore

Start-Sleep -Seconds 10

Start-Service -Name 'IdentityFinderEndpointService'  
