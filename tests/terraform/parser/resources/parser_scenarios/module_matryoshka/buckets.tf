module "bucket1" {
  source = "./bucket1"
}

resource "aws_s3_bucket" "example0" {
  bucket = "bucket0"
  tags = {
    yor_trace = "9b65d09b-d3e7-446e-baaa-ddc810470fc7"
  }
}