# pass

resource "aws_db_instance" "enabled_mysql" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = true
  tags = {
    yor_trace = "349da920-cbc0-4ef9-a8ac-2079272b4b49"
  }
}

resource "aws_db_instance" "enabled_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = true
  tags = {
    yor_trace = "70f6dfd4-cfd8-4295-851f-8780e612b52b"
  }
}

# failure

resource "aws_db_instance" "default_mysql" {
  allocated_storage = 5
  engine            = "mysql"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
  tags = {
    yor_trace = "f3365e04-015a-4c2e-8f93-c1c58ff24805"
  }
}

resource "aws_db_instance" "default_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
  tags = {
    yor_trace = "b6862677-1794-4489-a588-4f2969c82880"
  }
}

resource "aws_db_instance" "disabled_mysql" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = false
  tags = {
    yor_trace = "73e606b4-3c78-4b23-b11a-8ff90717a143"
  }
}

resource "aws_db_instance" "disabled_postgres" {
  allocated_storage = 5
  engine            = "postgres"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"

  iam_database_authentication_enabled = false
  tags = {
    yor_trace = "5ce336d5-3d3d-487d-a31d-688e45ea5f2c"
  }
}

# unknown

resource "aws_db_instance" "mariadb" {
  allocated_storage = 5
  engine            = "mariadb"
  instance_class    = "db.t3.small"
  password          = "password"
  username          = "username"
  tags = {
    yor_trace = "5dc396ea-a488-49f7-89ea-fd5559458e11"
  }
}
