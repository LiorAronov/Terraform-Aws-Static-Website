##########################################################################
# Output domain name variable.
##########################################################################
output "bucket_resource_domain_name" {
    value = aws_s3_bucket.domain_bucket.bucket
}

