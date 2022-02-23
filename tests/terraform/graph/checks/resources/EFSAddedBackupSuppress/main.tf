resource "aws_backup_plan" "example" {
  name = "tf_example_backup_plan"

  rule {
    rule_name         = "tf_example_backup_rule"
    target_vault_name = aws_backup_vault.test.name
    schedule          = "cron(0 12 * * ? *)"
  }

  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "enabled"
    }
    resource_type = "EC2"
  }
  tags = {
    yor_trace = "c823ea5b-7f89-48c5-b896-11637a48c4cb"
  }
}

resource "aws_backup_selection" "ok_backup" {
  iam_role_arn = aws_iam_role.example.arn
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    aws_db_instance.example.arn,
    aws_ebs_volume.example.arn,
    aws_efs_file_system.ok_efs.arn,
  ]
}

resource "aws_efs_file_system" "ok_efs" {
  creation_token = "my-product"

  tags = {
    Name      = "MyProduct"
    yor_trace = "3ad12f04-5907-41b3-b523-8b5df888d119"
  }
}

resource "aws_backup_selection" "not_ok_backup" {
  iam_role_arn = aws_iam_role.example.arn
  name         = "tf_example_backup_selection"
  plan_id      = aws_backup_plan.example.id

  resources = [
    aws_db_instance.example.arn,
    aws_ebs_volume.example.arn
  ]
}

resource "aws_efs_file_system" "ok_efs" {
  creation_token = "my-product"

  tags = {
    Name      = "MyProduct"
    yor_trace = "3ad12f04-5907-41b3-b523-8b5df888d119"
  }
}

resource "aws_efs_file_system" "not_ok_efs" {
  # checkov:skip=CKV2_AWS_18:Skip test
  creation_token = "my-product"

  tags = {
    Name      = "MyProduct"
    yor_trace = "791683cd-314e-4431-a372-5fd612fbaa0b"
  }
}