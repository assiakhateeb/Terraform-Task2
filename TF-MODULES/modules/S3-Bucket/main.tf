resource "aws_s3_bucket" "b" {
  bucket = var.s3_bucket
  acl    = var.acl_value

  tags = {
    Name        = var.bucket_name
    Environment = var.env
  }
}