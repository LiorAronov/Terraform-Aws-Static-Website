###############################################################
# Use module Remote-State-Locking-State.
###############################################################
module "website_1_remote_state_locking_state" {
    source = "../Modules/Remote_State_Locking_State"
    state_bucket_name = "remote-state-bucket-${var.domain_name}"
    state_locking_name = "locking-state-table-${var.domain_name}"
}

###############################################################
# Use module S3-Domain-Sub-Dumain-bucket.
###############################################################
module "website_1_s3_domain_sub_dumain_bucket" {
    source = "../Modules/S3_Domain_Sub_Dumain_bucket"
    domain_name = var.domain_name
}
##############################################################
# Use module S3_logs_bucket.
# # ##############################################################
# module "website_1_logs_bucket" {
#     source = "../Modules/S3_logs_bucket"
#     logs_bucket_name = "logs-bucket-${var.domain_name}"
#     pass_variables_domain_name = module.website_1_s3_domain_sub_dumain_bucket.bucket_resource_domain_name
# }
# ##############################################################
# # Use module Route53.
# ##############################################################
#  module "website_1_route53" {
#     source = "../Modules/Route53"
#     pass_variables_domain_name = module.website_1_s3_domain_sub_dumain_bucket.bucket_resource_domain_name
# }