resource "aws_security_group" "failed_cidr_blocks" {
  name        = "friendly_subnets"
  description = "Allows access from friendly subnets"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
  }
  tags = {
    yor_trace = "b8d1463f-78bb-49eb-998b-31cf475dc4bc"
  }
}

resource "aws_security_group" "passed_cidr_block" {
  name        = "friendly_subnets"
  description = "Allows access from friendly subnets"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
  }
  tags = {
    yor_trace = "58d437fa-aae9-4a84-9d8c-e7ca6d53789e"
  }
}