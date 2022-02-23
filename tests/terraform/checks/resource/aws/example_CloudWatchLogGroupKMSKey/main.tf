resource "aws_cloudwatch_log_group" "pass" {
  retention_in_days = 1
  kms_key_id        = "someKey"
  tags = {
    yor_trace = "f6e731dc-6cac-4fde-8913-6ad3aa2195f1"
  }
}

resource "aws_cloudwatch_log_group" "fail" {
  retention_in_days = 1
  tags = {
    yor_trace = "47bd6d1c-a020-4398-8f15-0d63c41bb645"
  }
}
