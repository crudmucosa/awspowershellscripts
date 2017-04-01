$fileData = Get-Content ".\subdomainlist.txt"

foreach ($i in $fileData)
{
    .\createS3Subdomains.ps1 -subdomainName $i
    #Write-Host Stand! $i
}