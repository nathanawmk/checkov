resource "aws_s3_bucket" "some-bucket" {
  bucket = "my-bucket"
  tags = {
    yor_trace = "a3c9b0f0-d911-438e-9ac5-ea5b7fd61f31"
  }
}

output "o1" {
  value = aws_s3_bucket.some-bucket.arn
}