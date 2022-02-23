resource "aws_s3_bucket" "mybucket" {
  bucket = "MyBucket"
  tags = {
    yor_trace = "5b478687-567c-4440-b2ab-c456a934b03a"
  }
}