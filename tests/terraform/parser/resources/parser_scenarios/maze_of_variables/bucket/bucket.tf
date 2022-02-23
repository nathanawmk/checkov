variable "name" {}

locals {
  MODULE_TAIL = "bucket"
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.name}-${local.MODULE_TAIL}"
  tags = {
    yor_trace = "caf423c8-bfa9-4b3d-82b3-6479b37ae15d"
  }
}