locals {
  bucket_name = "test_bucket_name"
}

resource "aws_s3_bucket" "template_bucket" {
  region        = "us-west-2"
  bucket        = local.bucket_name
  acl           = "acl"
  force_destroy = true
  tags = {
    yor_trace = "ff531b45-7558-4945-ac83-a3ce1871735c"
  }
}

