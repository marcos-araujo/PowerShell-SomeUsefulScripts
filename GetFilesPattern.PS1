  
param($outputfile)

$ErrorActionPreference = "Stop"

$pattern = "*"

$nameExpr = @{
	Label="Name";
	Expression= { $_.Name }
}

$lengthExpr = @{
	Label="Size";
	Expression= { "{0:N2}KB" -f ($_.Length / 1KB) }
}

$params = $nameExpr, $lengthExpr

$result = Get-ChildItem -Recurse -File | Where-Object Name -like $pattern | Select-Object $params

if ($outputfile -eq "JSON") {
	$result | ConvertTo-JSON | Out-File C:\users\user\Scripts\files.json
} elseif ($outputfile -eq "CSV") {
	$result | ConvertTo-CSV -NoTypeInformation | Out-File C:\users\user\Scripts\files.json
}