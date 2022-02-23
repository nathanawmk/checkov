# fail
resource "aws_backup_vault" "backup" {
  name = "example_backup_vault"
  tags = {
    yor_trace = "7ef10569-02bd-4a38-815f-695dd252274d"
  }
}

# pass
resource "aws_backup_vault" "backup_with_kms_key" {
  name        = "example_backup_vault"
  kms_key_arn = aws_kms_key.example.arn
  tags = {
    yor_trace = "75bd82aa-3dda-415a-832c-00d0e2fc86aa"
  }
}