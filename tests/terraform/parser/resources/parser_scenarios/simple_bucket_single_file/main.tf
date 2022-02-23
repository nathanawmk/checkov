resource "aws_s3_bucket" "test" {
  bucket = "my-test-bucket"
  tags = {
    yor_trace = "e50f3e97-ef7f-4789-b6bd-3a58dac89771"
  }
}
