Function Get-LongPaths{
    <#
    .SYNOPSIS
        Searches a directory recursivley for long paths.
    .DESCRIPTION
        For systems that may error out with long paths, this script finds folders and paths that are over 
        a certain number. By default this is 256. You must have access to the files and folders that are searched.
    .PARAMETER Path
        Mandatory. Path to recursively search. Example D:\Shares
    .PARAMETER Length
        Optional. By default this is set to 256 if not specified.
    .LINK
        https://www.christopherkeim.com
    .EXAMPLE
        Get-LongPath -Path D:\Shares
        Get-LongPath -Path D:\Departments -Length 250
    #>
    Param(
        [Parameter(Mandatory=$true)]
        [Alias('Path')]
        [string]$objPath
        ,
        [Parameter(Mandatory=$false)]
        [Alias('Length')]
        [int]$intLength = 256
    )
    Write-Host -ForegroundColor Yellow (Get-Date) ": Finding paths over " $intLength " recursively in " $objPath
    $arrResult = @() 
    $objItems =Get-childitem -LiteralPath $objPath -recurse  
    ForEach($objItem in $objItems){ 
        $objItemLength = $objItem.FullName.Length 
        If($objItemLength -ge $intLength){ 
            Write-Host -ForegroundColor Yellow (Get-Date) ": Found " $objItem.FullName " with a path length of " $objItem.FullName.Length
            $arrObject = New-Object PSObject 
            $arrObject | Add-Member -MemberType NoteProperty -Name "Name" -Value $objItem.Name 
            $arrObject | Add-Member -MemberType NoteProperty -Name "Directory" -Value $objItem.Directory 
            $arrObject | Add-Member -MemberType NoteProperty -Name "Length" -Value $objItem.FullName.Length 
            $arrObject | Add-Member -MemberType NoteProperty -Name "FullName" -Value $objItem.FullName 
            $arrResult += $arrObject 
        } 
    } 
    Write-Host -ForegroundColor Yellow (Get-Date) ": Finished"
    $arrResult #| Out-GridView
}

Get-LongPaths -Path "C:\Users\Administrator\Desktop\FOLDER\TEST_8-2" -intLength 2 | Export-Csv -NoTypeInformation -Path "C:\Users\Administrator\desktop\LongPaths.csv"