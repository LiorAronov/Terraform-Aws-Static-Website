###############################################################
# The variable of the s3-bucket Modules.
###############################################################
variable "domain_name" {
    type = string
}
variable "index_file_name" {
    default = "index.html"
}
variable "error_file_name" {
    default = "404.html"
}
variable "css_file_name" {
    default = "style.css"
}
variable "back_ground_file_name" {
    default = "back_ground.jpg"
}
