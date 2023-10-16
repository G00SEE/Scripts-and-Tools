function Trust-SPAddIn {
    [CmdletBinding(SupportsShouldProcess=$true)]
    [OutputType([int])]
    Param
    (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$AppInstanceId,
 
        [Parameter(Mandatory=$true, Position=1)]
        [string]$WebUrl
    )
 
    $url = "$($webUrl.trim("/"))/_layouts/15/appinv.aspx"

    $ie = New-Object -com internetexplorer.application

    $ie.visible=$true
    $ie.navigate2($url)
    while ($ie.document.title -ne "Grant Permission to an App") { Start-Sleep -seconds 5 }

    $appIDinput = $ie.Document.IHTMLDocument3_getElementById("ctl00_ctl00_PlaceHolderContentArea_PlaceHolderMain_IdTitleEditableInputFormSection_ctl01_TxtAppId")

    $appIDInput.Value = $AppInstanceId

    $lookupButton = $ie.Document.IHTMLDocument3_getElementById("ctl00_ctl00_PlaceHolderContentArea_PlaceHolderMain_IdTitleEditableInputFormSection_ctl01_BtnLookup")
    $lookupButton.click()

    while ($ie.busy) { Start-Sleep -Seconds 5 }

    $xmlField = $ie.Document.IHTMLDocument3_getElementById("ctl00_ctl00_PlaceHolderContentArea_PlaceHolderMain_TitleDescSection_ctl01_TxtPerm")
    $xmlfield.Value = '<AppPermissionRequests AllowAppOnlyPolicy="true"><AppPermissionRequest Scope="http://sharepoint/content/sitecollection/web" Right="Read" /></AppPermissionRequests>'

    $createButton = $ie.Document.IHTMLDocument3_getElementById("ctl00_ctl00_PlaceHolderContentArea_PlaceHolderMain_ctl04_RptControls_BtnCreate")
    $createButton.click()

    while ($ie.busy) { Start-Sleep -Seconds 5 }

    $trustButton = $ie.Document.IHTMLDocument3_getElementById("ctl00_ctl00_PlaceHolderContentArea_PlaceHolderMain_BtnAllow")
    $trustButton.Click()

    #$ie.Quit()
} 
Trust-SPAddIn -AppInstanceId '8a651ad9-6af5-4405-8d7a-eb1f1e1592de' -WebUrl 'http://spiriontestcom-admin.sharepoint.com'

