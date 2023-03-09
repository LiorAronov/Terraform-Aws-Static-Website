##########################################################################
# Add alias records to domain bucket.
##########################################################################
resource "aws_route53_record" "domain_bucket" {
  zone_id = data.aws_route53_zone.hosted_zones_1.id
  name    = var.pass_variables_domain_name
  type    = "A"
  alias {
    name = data.aws_s3_bucket.domain_bucket_data.website_domain
    zone_id = data.aws_s3_bucket.domain_bucket_data.hosted_zone_id
    evaluate_target_health = true 
  }
}

##########################################################################
# Add alias records to sub-domain bucket.
##########################################################################
resource "aws_route53_record" "subdomain_bucket" {
  zone_id = data.aws_route53_zone.hosted_zones_1.id
  name    = "www.${var.pass_variables_domain_name}"
  type    = "A"
  alias {
    name = data.aws_s3_bucket.subdomain_bucket_data.website_domain
    zone_id = data.aws_s3_bucket.subdomain_bucket_data.hosted_zone_id
    evaluate_target_health = true  
  }
}