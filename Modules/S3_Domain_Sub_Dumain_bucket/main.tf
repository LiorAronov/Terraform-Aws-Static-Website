##########################################################################
# The S3 Domain bucket.
##########################################################################
resource "aws_s3_bucket" "domain_bucket" {
    bucket = var.domain_name
}
##########################################################################
resource "aws_s3_bucket_acl" "domain_bucket_acl" {
  bucket = aws_s3_bucket.domain_bucket.id
  acl    = "private"
}
##########################################################################
resource "aws_s3_bucket_policy" "domain_bucket_policy" {
    bucket = aws_s3_bucket.domain_bucket.id
    policy = data.aws_iam_policy_document.allow_public_access.json
}
##########################################################################
resource "aws_s3_bucket_website_configuration" "domain_bucket_configuration" {
  bucket = aws_s3_bucket.domain_bucket.id

  index_document {
    suffix = var.index_file_name
  }
  error_document {
    key = var.error_file_name
  }
}