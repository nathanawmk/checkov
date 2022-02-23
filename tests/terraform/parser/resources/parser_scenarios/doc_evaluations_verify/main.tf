resource "aws_s3_bucket" "my_bucket" {
  region        = var.region
  bucket        = local.bucket_name
  acl           = var.acl
  force_destroy = true
  tags = {
    yor_trace = "3b5d10f6-d64f-41b8-a359-257c5f682041"
  }
}