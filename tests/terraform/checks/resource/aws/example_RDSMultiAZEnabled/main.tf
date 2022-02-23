# fail
resource "aws_db_instance" "disabled" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
  multi_az       = false
  tags = {
    yor_trace = "aa3f5fe2-ee4e-48a5-9be1-93bb316d02e6"
  }
}

# fail
resource "aws_db_instance" "default" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
  tags = {
    yor_trace = "2dac9dd6-44b0-4c68-bcc7-47875b12d537"
  }
}

# pass
resource "aws_db_instance" "enabled" {
  name   = "name"
  engine = "mysql"

  identifier     = "id"
  instance_class = "foo"
  multi_az       = true
  tags = {
    yor_trace = "41b7c4a5-1a89-430f-a397-2a07126432ef"
  }
}