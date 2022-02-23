# pass

resource "aws_dynamodb_table" "cmk" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  server_side_encryption {
    enabled     = true
    kms_key_arn = "arn:aws:kms:us-west-2:123456789012:key/1234abcd-12ab-34cd-56ef-1234567890ab"
  }
  tags = {
    yor_trace = "45a2e113-83f7-4625-9788-d30249259701"
  }
}

# failure

resource "aws_dynamodb_table" "default" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }
  tags = {
    yor_trace = "db909597-0855-43eb-9087-be40e27f5aa5"
  }
}

resource "aws_dynamodb_table" "encrypted_false" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  server_side_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "813c63bf-7b32-45d0-a45d-b1da0fe039c1"
  }
}

resource "aws_dynamodb_table" "encrypted_no_cmk" {
  name           = "GameScores"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "UserId"
  range_key      = "UserId"

  attribute {
    name = "UserId"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "b706a368-018e-4223-a713-ef8ad0423f9d"
  }
}
