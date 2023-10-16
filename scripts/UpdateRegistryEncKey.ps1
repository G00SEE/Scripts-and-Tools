

$CurrentKey = Get-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Identity Finder\Client\Console" -name encKey
$CorrectKey = 'BgIAAACkAABSU0ExABAAAAEAAQAVkW0F2mXaJYjmzAmPmNjI0FAwAY5OE2EBUgwWDLryUe3KOZ2TR1BBNicvQBNLSp8O02OCsNpFm9uKdCE1lAwO+PK9kvEbwMi8zRTls+D54Na0qLdgkNcHtTtszlkLJicuRstPfUK75LcA2vucr2E5f/+I0ZtBmIvkDW4ebRXJK+oNZgLCQ4JXnroD++LYRGk7m+aR5NCGQk43F4K97IYKZl3R3sdNIiBH8GK1DCgwvt461nCLnUfST9pL2z/sYmFazQQuxQmkZJZuhKPR+65N3cvDYT+BR+ySMNTFYOUrNOfuPr9xi590KBFANoB8gisk2OFlg7jP8aO3MGjl16CuOVobhaIiJS6TgkGs+3dGJl06G7mGQtWLWeCfRkhtMQO8ugM+brNyrJ3MaQzMuozzd9VAHc25CQHkiX4FF0TF0K9BE8DNADevnIe75h44GYZhi8/dRxbiIaxHFrKZq5JbiqE4dgGuNNuXj2GqivJl77hwSlh00xjEenTXCx+/xZigJbgA2JCoOT3e1TpLscY6T5Zjigqcy5e8WDojRqVD+KZqiathJGRtms0dvEJ46Ubrpjhy1n63hqK9u5oTnP6d0k7iBlOC3FygIrMicMjwRDQ8mkdMJYUVS5G7hL12U1Zr41k3VqF4jq3C4fhX9E9xzsq8Sj6WppjJe+A8UVQpvA=='

#$CurrentKey.encKey
#$CorrectKey


if ($CurrentKey.encKey -ne $CorrectKey){

#Set-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Identity Finder\Client\Console" -Name encKey -Value $CorrectKey
write-host "registry updated"

}

else{
write-host "no update needed"
}