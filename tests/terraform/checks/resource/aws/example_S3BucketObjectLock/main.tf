# pass

resource "aws_s3_bucket" "enabled_via_object" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration = {
    object_lock_enabled = "Enabled"
  }
  tags = {
    yor_trace = "546bc7b6-8bf5-4922-b9b7-8961fafd1578"
  }
}

resource "aws_s3_bucket" "enabled_via_block" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  tags = {
    yor_trace = "e87ffdcf-0521-48b2-8f1c-5a84a415c914"
  }
}

# failure

resource "aws_s3_bucket" "disabled_via_object" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration = {
    object_lock_enabled = "Disabled"
  }
  tags = {
    yor_trace = "6f90ba38-7532-4468-9f80-8580ef37fead"
  }
}

resource "aws_s3_bucket" "disabled_via_block" {
  bucket = "test-bucket"
  acl    = "private"

  object_lock_configuration {
    object_lock_enabled = "Disabled"
  }
  tags = {
    yor_trace = "6e66fcbc-8627-4b65-b5e4-af4fa9aa98f1"
  }
}

# unknown

resource "aws_s3_bucket" "default" {
  bucket = "test-bucket"
  acl    = "private"
  tags = {
    yor_trace = "8a38efc6-681f-4234-8526-2c938d7c604d"
  }
}
