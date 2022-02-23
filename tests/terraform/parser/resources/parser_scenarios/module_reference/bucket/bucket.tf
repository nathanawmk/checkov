output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}

resource "aws_s3_bucket" "example" {
  bucket = "my_bucket"
  tags = {
    yor_trace = "198bcacf-f4de-4274-b72d-402b636aec6f"
  }
}