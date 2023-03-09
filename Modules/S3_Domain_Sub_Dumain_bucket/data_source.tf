#########################################################################
# Data source public read policy.
#########################################################################
data "aws_iam_policy_document" "allow_public_access" {
 statement {
   principals {
      type        = "AWS"
      identifiers = ["*"]
      }
    actions = [
      "s3:GetObject",
      ]
     
    resources = [
      "arn:aws:s3:::${var.domain_name}",
      "arn:aws:s3:::${var.domain_name}/*",
      ]
  }
}