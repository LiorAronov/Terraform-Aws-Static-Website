##########################################################################
# Data source for the S3 logs bucket configuration. 
##########################################################################
data "aws_s3_bucket" "domain_bucket_data" {
  bucket = var.pass_variables_domain_name
}

