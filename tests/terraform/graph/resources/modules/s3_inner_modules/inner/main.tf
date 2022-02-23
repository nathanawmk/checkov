resource "aws_s3_bucket" "inner_s3" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = ""
  versioning {
    enabled = var.versioning
  }
  tags = {
    yor_trace = "a0f1afca-18c5-4ae0-a648-33e6c07ee281"
  }
}