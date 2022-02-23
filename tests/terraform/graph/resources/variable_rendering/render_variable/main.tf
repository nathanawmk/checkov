resource "aws_s3_bucket" "template_bucket" {
  region        = var.region
  bucket        = "test_bucket_name"
  acl           = "acl"
  force_destroy = true
  tags = {
    yor_trace = "3496318c-fb7b-4a40-80fd-269bde127029"
  }
}