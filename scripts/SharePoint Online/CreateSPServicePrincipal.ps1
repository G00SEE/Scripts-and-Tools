$principalNames =  Import-Csv -path "C:\Users\Administrator\Downloads\SharePointScriptsTesting\PrincipalNames.csv"


function new-AES256Key {
    $random = [System.Security.Cryptography.RandomNumberGenerator]::Create();
    $buffer = New-Object byte[] 32;
    $random.GetBytes($buffer);
    [BitConverter]::ToString($buffer).Replace("-", [string]::Empty);
}

Connect-MsolService

 $output = foreach ($principal in $principalNames){

    #write-output $principal.PrincipalName;
    $clientID = [guid]::NewGuid();
    $clientSecret = new-AES256Key;
    New-MsolServicePrincipal -AppPrincipalId $clientID -ServicePrincipalName $principal.PrincipalName  -DisplayName $principal.PrincipalName -Type Symmetric -Usage Verify -Value $clientSecret  -Addresses (New-MsolServicePrincipalAddresses -Address "https://www.spiriontestcom.com/default.aspx" ) | Out-Null
    [PSCustomOBject] @{
        PrincipalName = $principal.PrincipalName
        ClientID = $clientID
        Secret = $clientSecret
    }
   


}
$csvOutput = $outPut | ConvertTo-Csv -NoTypeInformation

$csvOutput | out-file -LiteralPath 'C:\Users\Administrator\Downloads\SharePointScriptsTesting\output.csv'  
