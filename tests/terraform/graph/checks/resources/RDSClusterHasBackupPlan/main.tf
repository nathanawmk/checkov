resource "aws_rds_cluster" "rds_cluster_good" {
  cluster_identifier = "aurora-cluster-demo"
  engine             = "aurora-mysql"
  engine_version     = "5.7.mysql_aurora.2.03.2"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "bar"
  tags = {
    yor_trace = "6c6da03f-21d1-4acb-89a2-4f5d413233c1"
  }
}

resource "aws_rds_cluster" "rds_cluster_bad" {
  cluster_identifier = "aurora-cluster-demo"
  engine             = "aurora-mysql"
  engine_version     = "5.7.mysql_aurora.2.03.2"
  availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "bar"
  tags = {
    yor_trace = "aa7fd0e9-ec40-4dd0-ba7e-bb8a3fbb28cb"
  }
}

resource "aws_backup_plan" "example" {
  name = "tf_example_backup_plan"

  rule {
    rule_name         = "tf_example_backup_rule"
    target_vault_name = "vault-name"
    schedule          = "cron(0 12 * * ? *)"
  }
  tags = {
    yor_trace = "13544ff4-2ade-4ec0-8308-93e0a74b4f21"
  }
}

resource "aws_backup_selection" "backup_good" {
  iam_role_arn = "arn:partition:service:region:account-id:resource-id"
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    aws_rds_cluster.rds_cluster_good.arn
  ]
}

resource "aws_backup_selection" "backup_bad" {
  iam_role_arn = "arn:partition:service:region:account-id:resource-id"
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    aws_rds_cluster.rds_cluster_good.arn
  ]
}