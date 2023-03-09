##########################################################################
# The S3 Logs bucket.
##########################################################################
resource "aws_s3_bucket" "logs_bucket" {
    bucket = var.logs_bucket_name
}
##########################################################################
resource "aws_s3_bucket_acl" "logs_bucket_acl" {
  bucket = aws_s3_bucket.logs_bucket.id
  acl    = "log-delivery-write"
}
##########################################################################
resource "aws_s3_bucket_logging" "the_target_bucket_log" {
  bucket        = data.aws_s3_bucket.domain_bucket_data.id
  target_bucket = aws_s3_bucket.logs_bucket.id
  target_prefix = "log/"
}