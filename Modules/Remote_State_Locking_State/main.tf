##########################################################################
# The S3 bucket of the state file.
##########################################################################
resource "aws_s3_bucket" "terraform_state" {
    bucket = var.state_bucket_name
}

##########################################################################
# Enable versioning for the S3 bucket.
##########################################################################
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
    }
}