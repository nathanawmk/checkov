# pass
resource "aws_s3_bucket" "passed_bucket" {
  bucket = "passed_bucket"
  acl    = var.private_acl
  tags = {
    yor_trace = "5330d30a-2541-4b04-a5f1-5dcef30b500f"
  }
}

# fail
resource "aws_s3_bucket" "failed_bucket" {
  bucket = "failed_bucket"
  acl    = var.public_read_write_acl
  tags = {
    yor_trace = "98ce5a31-0f2b-451c-87fe-040087a36cc5"
  }
}

### variables not in scope or dont exist ###

resource "aws_s3_bucket" "unknown_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = var.var_doesnt_exist
  tags = {
    yor_trace = "9999a9a3-6cb4-4a1b-a864-9cd7bf1d0553"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_2" {
  bucket = "unknown_acl_bucket_2"
  acl    = var.unscoped_private_acl
  tags = {
    yor_trace = "b3ecfc87-109a-4d1a-adbe-c5eebd80bf0c"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_3" {
  bucket = "unknown_acl_bucket_3"
  acl    = var.unscoped_public_read_write_acl
  tags = {
    yor_trace = "a2c59a83-7e5c-4780-a2e1-bd1a566b40c6"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_4" {
  bucket = "unknown_acl_bucket_4"
  acl    = local.unscoped_private_acl
  tags = {
    yor_trace = "91690d4c-eea0-4438-a6c7-274385f2b731"
  }
}

resource "aws_s3_bucket" "unknown_acl_bucket_5" {
  bucket = "unknown_acl_bucket_5"
  acl    = local.unscoped_public_read_write_acl
  tags = {
    yor_trace = "2729dd83-96c7-4787-82b9-82aba5a59375"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = data.doesnt_exist
  tags = {
    yor_trace = "e7a180b9-2e3e-456c-a425-4be6c5be43fa"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = module.doesnt_exist
  tags = {
    yor_trace = "e7a180b9-2e3e-456c-a425-4be6c5be43fa"
  }
}