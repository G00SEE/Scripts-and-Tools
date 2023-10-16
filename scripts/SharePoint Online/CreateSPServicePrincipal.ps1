#Connect-MsolService
#Remove-MsolServicePrincipal -AppPrincipalId "9542ae7b-5750-49d6-860c-1433e3f6b995"

#Get-MsolServicePrincipal -AppPrincipalId "e5a6fada-b35b-4547-ae2d-224e204d3a8b" #created manually before
#Get-MsolServicePrincipal -AppPrincipalId "9542ae7b-5750-49d6-860c-1433e3f6b995" ##newone, removed
Get-MsolServicePrincipal -AppPrincipalId "56b618fa-a68e-4de1-af72-1db8d2ddb3d3"


New-MsolServicePrincipal -ServicePrincipalName "GR-PS_Demo" -DisplayName "GR-PS_Demo" -Addresses (New-MsolServicePrincipalAddresses -Address "https://www.spiriontestcom.com/default.aspx" )



