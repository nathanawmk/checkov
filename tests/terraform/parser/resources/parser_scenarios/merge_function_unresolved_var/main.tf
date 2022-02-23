locals {
  common_tags = {
    Tag1 = "one"
    Tag2 = "two"
  }
}

variable "ENV" {}

resource "aws_s3_bucket" "bucket" {
  # var.ENV has no default, so need to evaluate the merge without the
  # fully resolved statement.
  tags = merge(local.common_tags, { Name = "my-bucket-${var.ENV}" }, {
    yor_trace = "a1ad70d2-b214-45fe-84e6-0938828d0bae"
  })
}