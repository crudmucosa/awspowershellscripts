#createS3Subdomains.ps1
#Create S3 buckets named as subdomains for a given website. Useful for tying said buckets to 
#AWS Route53 mappings 
param (
	[Parameter(Mandatory=$true)][String]$subdomainName,
	#[string]$domainName = 'picturesofus.blah'
	[string]$domainName = 'picturesofus.net'
)

$bucketName = "$subdomainName.$domainName"
$policyJSON = '{
   "Version": "2012-10-17",
   "Statement": [
      {
            "Sid": "PublicReadForGetBucketObjects",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::' + $bucketName + '/*"
        }
    ]
}'

New-S3Bucket -BucketName $bucketName -PublicReadOnly
Write-S3BucketWebsite -BucketName $bucketName -WebsiteConfiguration_IndexDocumentSuffix index.html
Write-S3BucketPolicy -BucketName $bucketName -Policy $policyJSON

Write-Host Jobs done!