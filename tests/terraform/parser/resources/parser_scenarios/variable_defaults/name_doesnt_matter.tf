variable "BUCKET_NAME" {
  type    = string
  default = "this-is-my-default"
}

resource "aws_s3_bucket" "test" {
  bucket = var.BUCKET_NAME
  tags = {
    yor_trace = "cb92b80d-9431-4fec-b07a-8678d21c299e"
  }
}
