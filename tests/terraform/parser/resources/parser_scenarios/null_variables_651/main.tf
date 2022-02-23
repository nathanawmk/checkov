variable "logging_include_cookies" {
  type        = bool
  description = "Whether to enable cookies in access logging"
  default     = null
}

variable "logging_bucket_id" {
  type        = string
  description = "The bucket ID where to store access logs"
  default     = null
}

variable "logging_bucket_prefix" {
  type        = string
  description = "The prefix where to store access logs"
  default     = null
}

resource "aws_cloudfront_distribution" "cf_dis" {
  enabled = true
  logging_config {
    include_cookies = var.logging_include_cookies
    bucket          = var.logging_bucket_id
    prefix          = var.logging_bucket_prefix
  }
  tags = {
    yor_trace = "ae5f43ee-61e3-4017-888b-440989767fc0"
  }
}


resource "aws_s3_bucket" "website_bucket" {
  versioning {
    enabled = var.versioning
  }
  tags = {
    yor_trace = "bfbe8fdb-5c61-4160-bd0d-5e8ee3cf0555"
  }
}

variable "versioning" {
  default = null
}