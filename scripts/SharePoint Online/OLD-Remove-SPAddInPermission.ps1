[void] [System.Reflection.Assembly]::LoadWithPartialName("'System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("'Microsoft.VisualBasic")

function Remove-SPAddInPermission {
    [CmdletBinding(SupportsShouldProcess=$true)]
    [OutputType([int])]
    Param
    (
        [Parameter(Mandatory=$false, Position=0)]
        [string]$AppInstanceId,
 
        [Parameter(Mandatory=$true, Position=1)]
        [string]$WebUrl
    )
 
    $url = "$($webUrl.trim("/"))/_layouts/15/appprincipals.aspx"
    $ie = New-Object -com internetexplorer.application

    $ie.visible=$true
    $ie.navigate2($url)
    while ($ie.document.title -ne "Site Collection App Permissions") { 
    
    $ie.document.title
    write-host 'waiting'
    Start-Sleep -seconds 5 
    
    }

    #$ie.document | get-member
    #$Ids = $ie.Document.IHTMLDocument3_getElementById("ctl00_ctl00_PlaceHolderContentArea_PlaceHolderMain_GridApps") 
    $Ids = $ie.Document.IHTMLDocument3_getelementsByTagName('td') | ? { $_.InnerHTML -like '*1063d671debf*'} | Select-Object -Property innertext 
    $Btns = $ie.Document.IHTMLDocument3_getelementsByTagName('a') | ? { $_.id -like '*PlaceHolderContentArea*' } | Select-Object -Property id
    $listLength =  $Ids.count
    #$listLength
   
   $finalList = for($i = 0; $i -le $listLength; $i++){
   $AppIdentifier = $Ids[$i].innerText
   $DelBtn = $Btns[$i].id
   
   #$AppIdentifier
   #$DelBtnId

   [PSCustomObject]@{ 
            AppId = $AppIdentifier
            DelBtn = $DelBtn            
            }


   }
  $DelBtnId = $finalList | ? {$_.AppId -like "*$AppInstanceId*"} | Select-Object -Property DelBtn
  # $DelBtnId.DelBtn
  $HTMLDeleteBtn = $ie.Document.IHTMLDocument3_getElementById($DelBtnId.DelBtn)
  $HTMLDeleteBtn.click()

  $popup = New-Object -comobject wscript.shell
  if ($popup.AppActivate('Message from webpage')){
  Start-Sleep -Seconds 5
  $popup.sendkeys('{ENTER}')
}


} 

Remove-SPAddInPermission  -WebUrl 'http://spiriontestcom-admin.sharepoint.com' -AppInstanceId '8411e0b7-9692-43ba-9efa-e4bea88836a8'