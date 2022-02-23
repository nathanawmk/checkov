module "bucket2" {
  source = "./bucket2"
}

resource "aws_s3_bucket" "example1" {
  bucket = "bucket1"
  tags = {
    yor_trace = "64cd5e89-895c-4927-b805-1174b0eaa0d4"
  }
}