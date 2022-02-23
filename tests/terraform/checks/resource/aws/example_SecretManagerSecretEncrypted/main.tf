# pass

resource "aws_secretsmanager_secret" "enabled" {
  name = "secret"

  kms_key_id = var.kms_key_id
  tags = {
    yor_trace = "7ef90153-7b37-460f-9dbc-78c69d195636"
  }
}

# failure

resource "aws_secretsmanager_secret" "default" {
  name = "secret"
  tags = {
    yor_trace = "2bac4002-a10c-4a29-8091-95864ec4e351"
  }
}
