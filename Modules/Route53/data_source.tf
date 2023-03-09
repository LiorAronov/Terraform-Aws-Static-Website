##########################################################################
# Data source for the route 53 configuration. 
##########################################################################
data "aws_route53_zone" "hosted_zones_1" {
 name = var.pass_variables_domain_name
}
##########################################################################
data "aws_s3_bucket" "domain_bucket_data" {
  bucket = var.pass_variables_domain_name
}
##########################################################################
data "aws_s3_bucket" "subdomain_bucket_data" {
  bucket = "www.${var.pass_variables_domain_name}"
}
