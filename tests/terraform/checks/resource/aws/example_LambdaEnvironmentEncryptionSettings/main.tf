resource "aws_lambda_function" "fail" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  environment {
    test = "true"
  }
  tags = {
    yor_trace = "98344971-9003-4ddc-8c70-774fe39df8c9"
  }
}

resource "aws_lambda_function" "failkmsnovars" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  kms_key_arn = aws_kms_key.anyoldguff.arn
  tags = {
    yor_trace = "561a64fd-9989-4270-96d0-9c39552e6128"
  }
}

resource "aws_lambda_function" "ignore" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  tags = {
    yor_trace = "a850d473-85c9-476d-a675-3e85af884fee"
  }
}

resource "aws_lambda_function" "pass" {
  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
  environment {
    test = "true"
  }
  kms_key_arn = aws_kms_key.anyoldguff.arn
  tags = {
    yor_trace = "da2a9a35-e7d1-43d8-9428-f1b5c7b41000"
  }
}