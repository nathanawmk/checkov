locals {
  BAD_VAR            = var.var_not_there
  BAD_LOCAL          = local.local_not_there
  BAD_MODULE         = module.module_not_there.nope
  BAD_MODULE2        = module.module_not_there
  BAD_MODULE3        = module.module_not_there.nope.still_not
  QUOTE_IN_QUOTE_446 = "${filemd5("${path.module}/templates/some-file.json")}"
}

resource "aws_lambda_function" "test_lambda" {
  source_code_hash = "${filemd5("${path.module}/templates/some-file.json")}"
  tags = {
    yor_trace = "9315b91c-2ae7-432d-a4ec-b8348447d034"
  }
}