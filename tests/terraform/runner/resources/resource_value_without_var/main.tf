# pass
resource "aws_s3_bucket" "enabled_bucket" {
  bucket = "enabled_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_enabled
  }
  tags = {
    yor_trace = "2c819126-904b-4aef-b385-15b1197bbeb1"
  }
}

# fail
resource "aws_s3_bucket" "disabled_bucket" {
  bucket = "disabled_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_disabled
  }
  tags = {
    yor_trace = "59897e2c-0bb2-4c5c-be69-053e25cdd9e9"
  }
}

### variables not in scope or dont exist ###

resource "aws_s3_bucket" "unknown_var_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_unknown
  }
  tags = {
    yor_trace = "a60f9858-d77d-42fa-9903-79a55aaa558b"
  }
}

resource "aws_s3_bucket" "unknown_var_2_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_disabled_2
  }
  tags = {
    yor_trace = "d3800708-0e2e-4578-88e5-29e6c4ba857a"
  }
}

resource "aws_s3_bucket" "unknown_local_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = local.versioning_disabled
  }
  tags = {
    yor_trace = "ddc721a0-165b-4087-82b8-07a1a2b420fe"
  }
}

resource "aws_s3_bucket" "unknown_enabled_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = var.versioning_enabled_2
  }
  tags = {
    yor_trace = "a280e760-2ca2-46c4-ac3c-56db8992d9a8"
  }
}

resource "aws_s3_bucket" "unknown_enabled_local_bucket" {
  bucket = "unknown_bucket"
  acl    = "private"

  versioning {
    enabled = local.versioning_enabled
  }
  tags = {
    yor_trace = "b2cd55a0-892d-458f-b397-fb4fe83b0ceb"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = "private"

  versioning {
    enabled = data.doesnt_exist
  }
  tags = {
    yor_trace = "88ac9194-096e-4b0e-a463-3a8becd0d288"
  }
}

resource "aws_s3_bucket" "unknown_data_acl_bucket" {
  bucket = "unknown_acl_bucket"
  acl    = "private"

  versioning {
    enabled = module.doesnt_exist
  }
  tags = {
    yor_trace = "88ac9194-096e-4b0e-a463-3a8becd0d288"
  }
}