# variable "instance_name_tag" {
#     type = string
#     default = "Terraform"
#     description = "The Value Of The Name Tag; Default Is 'Terraform' "
# }

# variable "instance_ami" {
#     type = string
#     description = "The AMI To Be Used To Create The Instance"
# }

# variable "instance_type" {
#     type = string
#     default = "t2.micro"
#     description = "The Instance Type To Be Created; Default Is t2.micro"
# }

# variable "availability_zone" {
#     type = string
#     description = "The AZ To Create The Instance"
# }

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "The Instance Type To Be Created; Default is t2.micro"
}

variable "instance_name" {
    type = string
    default = "web-server"
}