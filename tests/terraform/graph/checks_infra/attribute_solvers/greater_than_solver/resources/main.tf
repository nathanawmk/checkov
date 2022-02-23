resource "aws_s3_bucket" "b1" {
  bucket = "abc"
  tags = {
    yor_trace = "a06c11e7-0f60-4d5c-be1b-e60daa2a9912"
  }
}

resource "aws_s3_bucket" "b2" {
  bucket = "xyz"
  tags = {
    yor_trace = "bea04ea7-a5b1-4415-990a-051715edd96c"
  }
}

resource "aws_s3_bucket" "b3" {
  bucket = "ccc"
  tags = {
    yor_trace = "395f270b-1757-40f4-b373-e980ee41ae59"
  }
}