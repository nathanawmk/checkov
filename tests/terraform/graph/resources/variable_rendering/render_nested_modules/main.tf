provider "aws" {
  profile = var.aws_profile
  region  = "us-east-1"
  alias   = "east1"
}

locals {
  dummy_with_dash = format("-%s", var.dummy_1)
  bucket_name     = var.bucket_name
  x = {
    y = "z"
  }
}
resource "aws_instance" "example" {
  ami           = local.ami_name
  instance_type = module.child.myoutput
  tags = {
    yor_trace = "d0bb1d80-a9aa-4411-a9f0-abc2421acd1f"
  }
}

resource "aws_s3_bucket" "template_bucket" {
  provider      = aws.east1
  region        = var.region
  bucket        = local.bucket_name
  acl           = var.acl
  force_destroy = true
  tags = {
    yor_trace = "f7c8706f-1dc6-4641-9752-7119b926da89"
  }
}

resource "aws_eip" "ip" {
  vpc      = local.is_vpc
  instance = aws_instance.example.id
  tags = {
    yor_trace = "3c5b8c4e-7a33-4d56-87a1-012f7d392640"
  }
}

locals {
  is_vpc   = true
  ami_name = local.dummy_with_dash
}

module "child" {
  source = "./child"
}