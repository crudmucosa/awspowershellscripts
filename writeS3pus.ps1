param (
	[string]$path = '.\',
	[string]$keyPrefix = '\',
	[Parameter(Mandatory=$true)][String]$folderName,
	[Parameter(Mandatory=$true)][String]$bucketName,
	[string]$searchPattern = '*.jpg'
)

	
	#Write-Host "Gonna do this thing! Write-S3Object -Folder `"$path$folderName\`"  -Recurse -SearchPattern `"$searchPattern`" -Prefix `"$folderName\`" -BucketName $bucketName"
	
Write-S3Object -Folder "$path$folderName\" -Recurse -SearchPattern "$searchPattern" -Prefix "$keyPrefix$folderName\" -BucketName "$bucketName"