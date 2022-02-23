variable "name" {}

locals {
  BUCKET_NAME = var.name
}

resource "aws_s3_bucket" "example" {
  bucket = local.BUCKET_NAME
  tags = {
    yor_trace = "5335c439-aae1-43a4-8c3d-69f50e561913"
  }
}