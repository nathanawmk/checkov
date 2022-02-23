
resource "aws_redshift_parameter_group" "failasfalse" {
  name   = var.param_group_name
  family = "redshift-1.0"

  parameter {
    name  = "require_ssl"
    value = "false"
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }
  tags = {
    yor_trace = "3bbcddb1-b9ee-468d-a740-2efc430b0c2a"
  }
}


resource "aws_redshift_parameter_group" "fail" {
  name   = var.param_group_name
  family = "redshift-1.0"

  tags = {
    yor_trace = "41371473-476b-48fe-a7c3-497287ed366c"
  }
}


resource "aws_redshift_parameter_group" "pass" {
  name   = var.param_group_name
  family = "redshift-1.0"

  parameter {
    name  = "require_ssl"
    value = "true"
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }
  tags = {
    yor_trace = "fd8c2746-b6cf-47ef-82d2-91b6d825ec0a"
  }
}

resource "aws_redshift_parameter_group" "passbutbool" {
  name   = var.param_group_name
  family = "redshift-1.0"

  parameter {
    name  = "require_ssl"
    value = true
  }

  parameter {
    name  = "enable_user_activity_logging"
    value = "true"
  }
  tags = {
    yor_trace = "268b06d7-8d6a-4737-8ad2-a2b6a87e070f"
  }
}