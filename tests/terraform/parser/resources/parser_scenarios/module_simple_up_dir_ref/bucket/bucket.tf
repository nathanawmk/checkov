resource "aws_s3_bucket" "mybucket" {
  bucket = "MyBucket"
  tags = {
    yor_trace = "3e254d39-0ce8-4417-890c-b0e8de12c26b"
  }
}