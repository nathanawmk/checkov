resource "aws_s3_bucket" "foo-bucket" {
  region        = var.region
  bucket        = local.bucket_name
  force_destroy = true

  tags = {
    Name      = "foo-${data.aws_caller_identity.current.account_id}"
    yor_trace = "feff3bf8-192d-4814-839a-f5f24542fd33"
  }
}
data "aws_caller_identity" "current" {}
