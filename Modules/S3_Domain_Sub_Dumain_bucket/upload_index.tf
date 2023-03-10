##########################################################################
# Upload the index file.
##########################################################################
resource "aws_s3_object" "upload_index_file" {
    bucket = aws_s3_bucket.domain_bucket.bucket
    key = var.index_file_name
    source = "../Dev/html/${var.index_file_name}"
    acl = "public-read"
    content_type = "text/html"
    source_hash = filemd5("../Dev/html/${var.index_file_name}")
}

##########################################################################
#  Upload the error 404 file.
##########################################################################
resource "aws_s3_object" "upload_error_file" {
    bucket = aws_s3_bucket.domain_bucket.bucket
    key = var.error_file_name
    source = "../Dev/html/${var.error_file_name}"
    acl = "public-read"
    content_type = "text/html"
    source_hash = filemd5("../Dev/html/${var.error_file_name}")
}

##########################################################################
#  Upload the back ground picture.
##########################################################################
resource "aws_s3_object" "upload_back_ground_picture" {
    bucket = aws_s3_bucket.domain_bucket.bucket
    key = "images/${var.back_ground_file_name}"
    source = "../Dev/web_image/${var.back_ground_file_name}"
    acl = "public-read"
    content_type = "jpg"
    source_hash = filemd5("../Dev/web_image/${var.back_ground_file_name}")
}

##########################################################################
#  Upload the css file.
##########################################################################
resource "aws_s3_object" "upload_css_file" {
    bucket = aws_s3_bucket.domain_bucket.bucket
    key = var.css_file_name
    source = "../Dev/css/${var.css_file_name}"
    acl = "public-read"
    source_hash = filemd5("../Dev/css/${var.css_file_name}")

}