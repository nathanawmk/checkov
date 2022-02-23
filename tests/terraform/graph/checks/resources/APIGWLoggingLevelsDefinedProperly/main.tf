resource "aws_api_gateway_rest_api" "ok_example" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "ok_example"
      version = "1.0"
    }
    paths = {
      "/path1" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "https://ip-ranges.amazonaws.com/ip-ranges.json"
          }
        }
      }
    }
  })

  name = "ok_example"
  tags = {
    yor_trace = "1a1e8805-2247-406e-9e59-978f58096afe"
  }
}

resource "aws_api_gateway_deployment" "ok_example" {
  rest_api_id = aws_api_gateway_rest_api.ok_example.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.ok_example.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "ok_example" {
  deployment_id = aws_api_gateway_deployment.ok_example.id
  rest_api_id   = aws_api_gateway_rest_api.ok_example.id
  stage_name    = "ok_example"
  tags = {
    yor_trace = "78937d91-eec4-4d27-97ac-99fc2e07240a"
  }
}

resource "aws_api_gateway_method_settings" "all" {
  rest_api_id = aws_api_gateway_rest_api.ok_example.id
  stage_name  = aws_api_gateway_stage.ok_example.stage_name
  method_path = "*/*"

  settings {
    metrics_enabled = true
    logging_level   = "ERROR"
  }
}

resource "aws_api_gateway_method_settings" "path_specific" {
  rest_api_id = aws_api_gateway_rest_api.ok_example.id
  stage_name  = aws_api_gateway_stage.ok_example.stage_name
  method_path = "path1/GET"

  settings {
    metrics_enabled = true
    logging_level   = "INFO"
  }
}

# Bad Example 1 - Not connected or connected with wrong logs errors


resource "aws_api_gateway_deployment" "not_connected" {
  rest_api_id = aws_api_gateway_rest_api.not_connected.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.not_connected.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "not_connected" {
  deployment_id = aws_api_gateway_deployment.not_connected.id
  rest_api_id   = aws_api_gateway_rest_api.not_connected.id
  stage_name    = "not_connected"
  tags = {
    yor_trace = "2d297fbd-a6d9-4cc9-9aeb-f39361b975b1"
  }
}

resource "aws_api_gateway_method_settings" "all" {
  rest_api_id = aws_api_gateway_rest_api.not_connected.id
  method_path = "*/*"

  settings {
    metrics_enabled = true
    logging_level   = "ERROR"
  }
}

resource "aws_api_gateway_method_settings" "path_specific" {
  rest_api_id = aws_api_gateway_rest_api.not_connected.id
  stage_name  = aws_api_gateway_stage.not_connected.stage_name
  method_path = "path1/GET"

  settings {
    metrics_enabled = true
    logging_level   = "DEBUG"
  }
}