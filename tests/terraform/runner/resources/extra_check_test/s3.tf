resource "aws_s3_bucket" "a" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Production"
    yor_trace   = "eaa18fb7-adb0-42cf-b75e-7311fbe2166e"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    yor_trace   = "5442d29d-c565-4cad-8036-6cc898808688"
  }
}


resource "aws_s3_bucket" "c" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
  tags = {
    yor_trace = "c6507f3f-247f-470d-9fb6-41daa150d532"
  }
}


