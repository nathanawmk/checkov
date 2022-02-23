resource "aws_flow_log" "example" {
  iam_role_arn    = "arn"
  log_destination = "log"
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.ok_vpc.id
  tags = {
    yor_trace = "c282a6d2-1482-4b04-8573-9bdb173737f9"
  }
}

resource "aws_vpc" "not_ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "dfd5438d-bb21-4027-b656-912a7e7be077"
  }
}

resource "aws_vpc" "ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "e8e0fe93-8452-4ba5-9db0-feb9fefa9c7c"
  }
}