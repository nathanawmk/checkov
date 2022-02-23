resource "aws_s3_bucket" "bucket_good_1" {
  bucket = "bucket_good"
  tags = {
    yor_trace = "bc52be26-a78e-418e-8387-9d767a591058"
  }
}

resource "aws_s3_bucket" "bucket_bad_1" {
  bucket = "bucket_bad_1"
  tags = {
    yor_trace = "47d78070-449a-4019-b74a-a4f1422b0bb6"
  }
}

resource "aws_s3_bucket" "bucket_bad_2" {
  bucket = "bucket_bad_2"
  tags = {
    yor_trace = "2c826427-1e2e-4956-8e5d-b52a22abb3ef"
  }
}

resource "aws_s3_bucket" "bucket_bad_3" {
  bucket = "bucket_bad_3"
  tags = {
    yor_trace = "8a975333-c8d6-4cde-a617-2853f76650f4"
  }
}

resource "aws_s3_bucket" "bucket_bad_4" {
  bucket = "bucket_bad_4"
  tags = {
    yor_trace = "f9fd55c1-39df-4b76-8fe8-681864fa6a31"
  }
}

resource "aws_s3_bucket_public_access_block" "access_good_1" {
  bucket = aws_s3_bucket.bucket_good_1.id

  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_public_access_block" "access_bad_1" {
  bucket = aws_s3_bucket.bucket_bad_1.id
}

resource "aws_s3_bucket_public_access_block" "access_bad_2" {
  bucket = aws_s3_bucket.bucket_bad_2.id

  block_public_acls   = false
  block_public_policy = false
}

resource "aws_s3_bucket_public_access_block" "access_bad_3" {
  bucket = aws_s3_bucket.bucket_bad_3.id

  block_public_acls   = false
  block_public_policy = true
}