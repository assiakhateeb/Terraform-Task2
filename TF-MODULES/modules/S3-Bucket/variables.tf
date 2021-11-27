variable "bucket_name" {
    type = string
    default = "My bucket"
    description = "The Value of the Name; default is 'S3' "
}

variable "acl_value" {
    type = string
    default = "private"
    description = "the acl value; default is 'private'"
}

variable "env" {
    type = string
    default = "Dev"
}

variable "s3_bucket" {
    type = string
    default = "assia-tf-test-bucket" 
}