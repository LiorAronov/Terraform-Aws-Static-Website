###########################################################
# Setting up the remote state and lock state.
##########################################################
# terraform {
#   backend "s3" {
#     bucket = "remote-state-bucket-<... Enter here the domain_name - Manually - ...>"
#     key = "website/terraform.tfstate"
#     region = "<... Enter here the region - Manually - ...>"
#     dynamodb_table = "locking-state-table-<... Enter here the domain_name - Manually - ...>"
#     encrypt = true
#   }
# }