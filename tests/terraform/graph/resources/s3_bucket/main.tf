resource "aws_s3_bucket" "destination" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = var.acl
  versioning {
    enabled = var.is_enabled
  }
  tags = {
    yor_trace = "b5270511-cee3-49a0-bb83-0767f218c561"
  }
}