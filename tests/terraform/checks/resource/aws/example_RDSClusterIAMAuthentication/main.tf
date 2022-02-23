# pass

resource "aws_rds_cluster" "enabled" {
  master_username = "username"
  master_password = "password"

  iam_database_authentication_enabled = true
  tags = {
    yor_trace = "531a629d-c92c-45b9-8226-a11403b804a8"
  }
}

# failure

resource "aws_rds_cluster" "default" {
  master_username = "username"
  master_password = "password"
  tags = {
    yor_trace = "5ff9d01f-6a59-41c6-b93d-c2b61d080946"
  }
}

resource "aws_rds_cluster" "disabled" {
  master_username = "username"
  master_password = "password"

  iam_database_authentication_enabled = false
  tags = {
    yor_trace = "40528b69-fb3f-470c-bc44-376d36922a57"
  }
}
