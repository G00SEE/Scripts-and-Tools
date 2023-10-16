$Dir = "C:\Users\Administrator\Desktop\FOLDER\Identity_Finder_Test_Data"
Get-ChildItem -Path $Dir -Recurse -file | Group-Object -Property extension -NoElement | Sort-Object -Property Count -Descending | Select-Object -Property Name, Count | Export-Csv -Path "C:\users\administrator\desktop\FileCountByExtension.csv" -NoTypeInformation

#backup option to specify a group of extensions.
#(Get-ChildItem -Recurse -File -Include *.txt, *.accdb, *.docx, *.xslx, *.csv, *.mdb, *.pdf, *.tiff | Measure-Object).Count

