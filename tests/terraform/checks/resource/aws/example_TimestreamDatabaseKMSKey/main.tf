# pass

resource "aws_timestreamwrite_database" "enabled" {
  database_name = "timestream"

  kms_key_id = var.kms_key_id
  tags = {
    yor_trace = "92cde45e-4599-4a9b-8862-356d00781ea6"
  }
}

# failure

resource "aws_timestreamwrite_database" "default" {
  database_name = "timestream"
  tags = {
    yor_trace = "690571f1-1a7a-4ff0-a790-3a3b0c0e9930"
  }
}
