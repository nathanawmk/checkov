resource "aws_s3_bucket" "example3" {
  bucket = "bucket3"
  acl    = "public-read" # used by test_runner.py
  tags = {
    yor_trace = "ecdb1cb1-e95c-448c-b306-bc5e45f69a6a"
  }
}