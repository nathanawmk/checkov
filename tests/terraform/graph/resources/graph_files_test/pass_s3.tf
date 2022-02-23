resource "aws_s3_bucket" "bucket_with_versioning" {
  versioning {
    enabled = var.versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.encryption
      }
    }
  }
  tags = {
    yor_trace = "7645fead-3940-4cd8-8fd7-b176a8c4e529"
  }
}