resource "aws_s3_bucket" "private" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    yor_trace   = "676c573b-5ebd-4891-90e6-00705106c8fd"
  }
}

resource "aws_s3_bucket" "public" {
  bucket = "my-tf-test-bucket"
  acl    = "public"

  tags = {
    Name        = "My other bucket"
    Environment = "Prod"
    yor_trace   = "5c1b23be-6b2c-46d1-a0f1-b8714799a1d1"
  }
}

resource "aws_s3_bucket" "non_tag" {
  bucket = "no-tags"
  acl    = "public"
  tags = {
    yor_trace = "e61af365-d022-4e50-bf6b-3b82fda95bb7"
  }
}
