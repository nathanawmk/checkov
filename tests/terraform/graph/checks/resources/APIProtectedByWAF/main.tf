resource "aws_api_gateway_rest_api" "pass" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = {
    yor_trace = "2a29a10a-1cc1-4a3e-9276-908bb2c9e3b3"
  }
}

resource "aws_api_gateway_rest_api" "private" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["PRIVATE"]
  }
  tags = {
    yor_trace = "e0601f1f-5f4a-48a0-9192-feb06c54fcf6"
  }
}

resource "aws_api_gateway_rest_api" "no_stage" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = {
    yor_trace = "ac926aa6-632a-4274-bf59-64d88d3b7680"
  }
}

resource "aws_api_gateway_rest_api" "no_assoc" {
  name = var.name

  policy = ""

  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = {
    yor_trace = "c23f6bb9-686d-4bdf-b699-02366c591d43"
  }
}

resource "aws_api_gateway_stage" "no_assoc" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.no_assoc.id
  stage_name    = "example"
  tags = {
    yor_trace = "3f797032-80b7-4258-be5a-0a6ac8640ede"
  }
}

resource "aws_api_gateway_stage" "private" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.private.id
  stage_name    = "example"
  tags = {
    yor_trace = "78762c38-f40b-4da6-9b6d-abaf2f0a16d5"
  }
}

resource "aws_api_gateway_stage" "no_api" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.no_api.id
  stage_name    = "example"
  tags = {
    yor_trace = "ce6f3c1d-afe7-4822-b652-1254f58d74b3"
  }
}

resource "aws_api_gateway_stage" "pass" {
  deployment_id = aws_api_gateway_deployment.example.id
  rest_api_id   = aws_api_gateway_rest_api.pass.id
  stage_name    = "example"
  tags = {
    yor_trace = "013f3c53-fcda-414f-9025-60e927267294"
  }
}

resource "aws_wafregional_web_acl_association" "pass" {
  resource_arn = aws_api_gateway_stage.pass.arn
  web_acl_id   = aws_wafregional_web_acl.foo.id
}
