locals {
  BUCKET_NAME = "my-bucket-name"
}

resource "aws_s3_bucket" "test_with_locals" {
  bucket = local.BUCKET_NAME
  tags = {
    yor_trace = "166e7d3d-b222-4804-868e-11a08f7ada13"
  }
}
