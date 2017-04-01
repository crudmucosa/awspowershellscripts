param (
	[Parameter(Mandatory=$true)][String]$subdomainName,
	[string]$domainName = 'picturesofus.blah'
	#[string]$domainName = 'picturesofus.net'
)

Write-Host Write-S3BucketWebsite -BucketName $subdomainName.$domainName -WebsiteConfiguration_IndexDocumentSuffix index.html

#{
#    "Version": "2012-10-17",
#   "Statement": [
#      {
#            "Sid": "PublicReadForGetBucketObjects",
#            "Effect": "Allow",
#            "Principal": "*",
#            "Action": "s3:GetObject",
#            "Resource": "arn:aws:s3:::picturesofus-aiesha/*"
#        }
#    ]
#}