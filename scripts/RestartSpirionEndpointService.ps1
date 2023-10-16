$svcStatus = Get-Service -Name 'IdentityFinderEndpointService' | Select-Object Status

if ($svcStatus.Status -eq 'Running'){

Stop-Service -Name 'IdentityFinderEndpointService' -Force

#Get-Service -Name 'IdentityFinderEndpointService'
}
Start-Sleep -Seconds 10

Start-Service -Name 'IdentityFinderEndpointService'

#Get-Service -Name 'IdentityFinderEndpointService' 
