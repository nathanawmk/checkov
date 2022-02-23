resource "aws_kms_key" "pass1" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags = {
    yor_trace = "ef9aba13-e8b6-41ce-80e2-182e24c82017"
  }
}

resource "aws_kms_key" "pass2" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "RSA_2096"
  tags = {
    yor_trace = "9cf78645-f99d-4f03-b341-957bea088784"
  }
}

resource "aws_kms_key" "pass3" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  enable_key_rotation      = true
  tags = {
    yor_trace = "71707316-dbd5-4218-ba08-963414c3544a"
  }
}

resource "aws_kms_key" "fail1" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  tags = {
    yor_trace = "89e3f72f-2de2-4407-a5f3-a9e77b1deb86"
  }
}

resource "aws_kms_key" "fail2" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
  enable_key_rotation     = false
  tags = {
    yor_trace = "7df29bf4-d3e2-449f-a580-cea496a32a3e"
  }
}

resource "aws_kms_key" "fail3" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  enable_key_rotation      = false
  tags = {
    yor_trace = "c5ab0f5b-382d-4bef-baf9-31d4fe1c2470"
  }
}

resource "aws_kms_key" "fail4" {
  description              = "KMS key 1"
  deletion_window_in_days  = 10
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  tags = {
    yor_trace = "6ac44a50-8402-42fc-bf16-99bcec17b284"
  }
}