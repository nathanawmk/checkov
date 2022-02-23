resource "aws_athena_workgroup" "pass" {
  name = "wg-encrypted"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://mys3bucket"
      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = "mykmsarn"
      }
    }
  }
  tags = {
    yor_trace = "306166af-1349-4f31-b0a8-942f2c45248a"
  }
}

resource "aws_athena_workgroup" "fail" {
  name = "wg-non-encrypted"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true

    result_configuration {
      output_location = "s3://mys3bucket"
    }
  }
  tags = {
    yor_trace = "9fb5c81c-823c-440e-a79b-20b0bd9681bf"
  }
}

