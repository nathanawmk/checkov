resource "aws_lambda_function" "this" {
  count = 0

  function_name = "lambda_function_name"
  role          = ""
  handler       = ""
  runtime       = ""
  tags = {
    yor_trace = "f830597b-ea5f-4d2e-b974-7dd970cd2284"
  }
}
