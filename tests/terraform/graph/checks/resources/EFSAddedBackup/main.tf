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
    yor_trace = "dbafeb90-3255-48f7-920e-dfbecb32b8ff"
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
    yor_trace = "739f89d9-5f76-4eb0-b715-8ab4dc3c6df0"
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
    yor_trace = "739f89d9-5f76-4eb0-b715-8ab4dc3c6df0"
  }
}

resource "aws_efs_file_system" "not_ok_efs" {
  creation_token = "my-product"

  tags = {
    Name      = "MyProduct"
    yor_trace = "d4a6d111-4d9e-499c-bcce-ce350739f10f"
  }
}