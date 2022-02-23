
resource "aws_s3_bucket" "b1" {
  bucket = "bucket1"
  tags = {
    yor_trace = "2b431d3c-1c5a-4e02-8dd6-c5a37b3ddb82"
  }
}
