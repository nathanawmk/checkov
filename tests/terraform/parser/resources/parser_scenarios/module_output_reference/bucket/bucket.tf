variable "tags" {}


resource "aws_s3_bucket" "bucket" {
  bucket = "its.a.bucket"
  # NOTE: Prior to find_var_blocks handling vars in parameters, this didn't work
  tags = merge(var.tags, { "more_tags" = "yes" }, {
    yor_trace = "48316ed8-ad61-4377-825d-54d789d083b8"
  })
}