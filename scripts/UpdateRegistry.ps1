

$MachineName = hostname
if ($MachineName -ne 'MASTER')
{

Write-Host 'updating registry'

#Get-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Identity Finder\Client\Console" -name serverUrl
#Get-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Identity Finder\Client\Console" -name encKey

Set-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Identity Finder\Client\Console" -Name ServerURL -Value 'http://web1/services'

Start-Sleep -Seconds 10

Restart-Service -DisplayName 'Spirion Endpoint Service'


}
