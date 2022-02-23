resource "aws_redshift_cluster" "redshift_good" {
  cluster_identifier = "tf-redshift-cluster"
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "Mustbe8characters"
  node_type          = "dc1.large"
  cluster_type       = "single-node"
  tags = {
    yor_trace = "cb232f86-54bf-44f0-bfad-7af5364a2ff5"
  }
}

resource "aws_redshift_cluster" "redshift_bad" {
  cluster_identifier = "tf-redshift-cluster"
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "Mustbe8characters"
  node_type          = "dc1.large"
  cluster_type       = "single-node"
  tags = {
    yor_trace = "a732ff9b-2dac-441b-bc03-cea6970100e3"
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
    yor_trace = "907c3b36-7279-451f-9273-4d539a4ca7ba"
  }
}

resource "aws_backup_selection" "backup_good" {
  iam_role_arn = "arn:partition:service:region:account-id:resource-id"
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    aws_redshift_cluster.redshift_good.arn
  ]
}

resource "aws_backup_selection" "backup_bad" {
  iam_role_arn = "arn:partition:service:region:account-id:resource-id"
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
  ]
}