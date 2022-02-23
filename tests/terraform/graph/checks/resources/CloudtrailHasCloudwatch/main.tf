resource "aws_cloudwatch_log_group" "example" {
  name = "Example"
  tags = {
    yor_trace = "d223f4d8-86cf-471e-b678-7e1cd6add620"
  }
}

resource "aws_cloudtrail" "aws_cloudtrail_ok" {
  name                       = "tf-trail-foobar"
  cloud_watch_logs_group_arn = "${aws_cloudwatch_log_group.example.arn}:*"
  tags = {
    yor_trace = "07f40e71-f364-46ef-b62d-f47aea065b4f"
  }
}

resource "aws_cloudtrail" "aws_cloudtrail_not_ok" {
  name = "tf-trail-foobar"
  tags = {
    yor_trace = "1dcd5049-2959-4614-90da-58b5851bfa6e"
  }
}