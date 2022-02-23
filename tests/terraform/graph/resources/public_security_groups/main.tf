resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    yor_trace = "884023c3-cd16-411c-8fc0-7e29dc63335d"
  }
}

resource "aws_security_group" "aws_security_group_public" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = ""
    to_port     = 0
  }
  tags = {
    yor_trace = "0ed8697f-929c-4ffc-b4d6-8222224d7502"
  }
}

resource "aws_security_group" "aws_security_group_private" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    cidr_blocks = ["25.09.19.92/0"]
    from_port   = 0
    protocol    = ""
    to_port     = 0
  }
  tags = {
    yor_trace = "6e0f907f-9ba3-4be8-b850-65c3c19949d3"
  }
}

resource "aws_db_security_group" "aws_db_security_group_public" {
  name = "rds_sg"

  ingress {
    cidr = "0.0.0.0"
  }
  tags = {
    yor_trace = "cda600a1-95a8-4f1a-a621-795eae303183"
  }
}

resource "aws_db_security_group" "aws_db_security_group_private" {
  name = "rds_sg"

  ingress {
    cidr = "10.0.0.0/24"
  }
  tags = {
    yor_trace = "3cb2d10b-0d6c-4633-a477-b0fe0dd847ef"
  }
}

resource "aws_redshift_security_group" "aws_redshift_security_group_public" {
  name = "redshift-sg"

  ingress {
    cidr = "0.0.0.0"
  }
}

resource "aws_redshift_security_group" "aws_redshift_security_group_private" {
  name = "redshift-sg"

  ingress {
    cidr = "25.09.19.92/0"
  }
}

resource "aws_elasticache_security_group" "aws_elasticache_security_group_public" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.aws_security_group_public.name]
}

resource "aws_elasticache_security_group" "aws_elasticache_security_group_private" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.aws_security_group_private.name]
}