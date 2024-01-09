 (Get-ChildItem -Path '\\web1\shares' -Recurse -File -Include ("*.txt","*.csv","*.pdf","*.tif","*.xml","*.ppt","*.pptx","*.docx","*.doc","*.xls","*.xlsx","*.msg") | Measure-Object).count 
