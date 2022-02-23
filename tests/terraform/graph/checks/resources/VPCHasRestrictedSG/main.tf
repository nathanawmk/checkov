resource "aws_vpc" "not_ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "c33f0e57-f6f3-451e-9c59-1a572ba38e4e"
  }
}

resource "aws_vpc" "not_ok_vpc_2" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "f2969563-0bf8-4d60-a4e2-7cf0a92be3e1"
  }
}

resource "aws_vpc" "not_ok_vpc_3" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "7f31e01c-e08d-4ff2-9dbd-1946191b36d7"
  }
}

resource "aws_vpc" "ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "1a24e488-ae36-48b7-9343-795cca24dc6c"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.ok_vpc.id
  tags = {
    yor_trace = "85aecf2e-493f-4d0e-a986-4c2ac7f2bf2b"
  }
}

resource "aws_default_security_group" "default_2" {
  vpc_id = aws_vpc.not_ok_vpc_2.id

  ingress {
    protocol  = "-1"
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "11fe0465-a5f2-4209-9e49-6a46d6d980da"
  }
}

resource "aws_default_security_group" "default_3" {
  vpc_id = aws_vpc.not_ok_vpc_3.id
  tags = {
    yor_trace = "257f1503-08bf-4f1d-bb25-7db91a939241"
  }
}

resource "aws_security_group_rule" "default_sg_rule" {
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  type              = "-1"
  security_group_id = aws_default_security_group.default_3.id
}
