resource "aws_lambda_function" "skip" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "exports.test"

  source_code_hash = filebase64sha256("lambda_function_payload.zip")
  runtime          = "nodejs12.x"

  environment {
    variables = {
      access_key = "AKIAIOSFODNN7EXAMPLE" #checkov:skip=CKV_SECRET_2:example
      secret_key = ""
    }
  }
  tags = {
    yor_trace = "9a37d410-f073-41e6-8db1-194b2b9c932b"
  }
}

resource "aws_lambda_function" "wrong_skip" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "exports.test"

  source_code_hash = filebase64sha256("lambda_function_payload.zip")
  runtime          = "nodejs12.x"

  environment {
    variables = {
      access_key = "AKIAIOS3F6KN7EXAMPLE" #checkov:skip=CKV_SECRET_5:wrong check id
      secret_key = ""
    }
  }
  tags = {
    yor_trace = "52be1d33-e0ed-430b-b9fa-14c2ecf8679f"
  }
}
