# pass

resource "aws_db_instance" "postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "postgres"
  username          = "postgres"

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  tags = {
    yor_trace = "61c9c3bd-d0e8-4e4d-8bea-29b616bd584e"
  }
}

resource "aws_db_instance" "mysql" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"

  enabled_cloudwatch_logs_exports = ["general", "error", "slowquery"]
  tags = {
    yor_trace = "79d7c92f-8d0b-4174-9d99-d980ec289948"
  }
}

# failure

resource "aws_db_instance" "default" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"
  tags = {
    yor_trace = "28c6ea20-2cb4-418e-811d-4b49d6fa22d5"
  }
}

resource "aws_db_instance" "empty" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "mysql"
  username          = "mysql"

  enabled_cloudwatch_logs_exports = []
  tags = {
    yor_trace = "5a24eff8-8cfd-4dc3-b2e3-fc69e3a1518b"
  }
}
