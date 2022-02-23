resource "aws_s3_bucket" "test" {
  bucket = var.BUCKET_NAME
  tags = {
    yor_trace = "5f16986c-d258-4361-924b-2276c059cf58"
  }
}
