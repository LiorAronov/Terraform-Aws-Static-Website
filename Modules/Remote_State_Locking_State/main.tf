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

##########################################################################
# The dynamodb table of the State Locking.
##########################################################################
resource "aws_dynamodb_table" "terraform_locks" {
    name = var.state_locking_name
    # name = "terraform-state-locking-website-23-022023"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
}
