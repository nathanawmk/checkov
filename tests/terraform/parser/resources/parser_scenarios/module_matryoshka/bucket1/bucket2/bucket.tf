module "bucket3" {
  source = "./bucket3"
}

resource "aws_s3_bucket" "example2" {
  bucket = "bucket2"
  tags = {
    yor_trace = "7178598e-3c00-48f5-8a23-83194da1d206"
  }
}