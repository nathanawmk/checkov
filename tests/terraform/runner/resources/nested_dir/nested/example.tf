resource "aws_s3_bucket" "foo-bucket" {
  region        = var.region
  bucket        = local.bucket_name
  force_destroy = true

  tags = {
    Name      = "foo-${data.aws_caller_identity.current.account_id}"
    yor_trace = "c4646243-afb5-49f5-beb0-9cfe9bd39c69"
  }
}
data "aws_caller_identity" "current" {}
