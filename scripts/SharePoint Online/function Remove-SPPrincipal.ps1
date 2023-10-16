 function Remove-SPPrincipal {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$AppInstanceId,

        [Parameter(Mandatory=$true, Position=1)]
        [string]$WebUrl
    )

 

    $url = "$($webUrl.trim("/"))/_layouts/15/appprincipals.aspx"

 

    $ie = New-Object -com internetexplorer.application
    $ie.visible=$true
    $ie.navigate2($url)

 

    while ($ie.document.title -ne "Site Collection App Permissions") { Start-Sleep -seconds 5 }

 

    while ($ie.busy) { Start-Sleep -Seconds 5 }

 

    $tablecollection = $ie.Document.IHTMLDocument3_getElementsByTagName("tr")
    $tableOutput = $tablecollection | ?{$_.innertext.ToString().Contains($AppInstanceId)}

 

 

    $deleteelement = $tableOutput.children[0].children[0]
    $scriptcall = $deleteelement.getAttribute("href")
    $splitscript = $scriptcall.split(':')

 

    $ie.Document.parentWindow.execScript($($splitscript[1]),$($splitscript[0]))

 

    while ($ie.busy) { Start-Sleep -Seconds 5 }

 

    $ie.Quit()

 

}

Remove-SPPrincipal -AppInstanceId '8a651ad9-6af5-4405-8d7a-eb1f1e1592de' -WebUrl 'http://spiriontestcom-admin.sharepoint.com'