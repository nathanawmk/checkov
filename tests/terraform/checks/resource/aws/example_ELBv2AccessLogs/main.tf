# pass

resource "aws_lb" "enabled" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = true
  }
  tags = {
    yor_trace = "14dcc0b9-8a34-4d35-b01e-f9381ce1be2a"
  }
}

resource "aws_alb" "enabled" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = true
  }
  tags = {
    yor_trace = "3a246564-f9c0-4909-8d6f-b9d870f09bcb"
  }
}

# failure

resource "aws_lb" "default" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "1bfa343a-9947-40b6-b621-ba382774d57b"
  }
}

resource "aws_alb" "default" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "9ae35194-b99a-4f8d-a9e6-80385a297e25"
  }
}

resource "aws_lb" "only_bucket" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket = var.bucket_name
  }
  tags = {
    yor_trace = "1eca77ad-c477-4686-bcc7-d67f8cf8ad6e"
  }
}

resource "aws_alb" "only_bucket" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket = var.bucket_name
  }
  tags = {
    yor_trace = "49791636-ed73-4480-be65-bdf58ba86bec"
  }
}

resource "aws_lb" "disabled" {
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = false
  }
  tags = {
    yor_trace = "b0e90a8e-b393-4998-a678-7be1cb190e51"
  }
}

resource "aws_alb" "disabled" {
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  access_logs {
    bucket  = var.bucket_name
    enabled = false
  }
  tags = {
    yor_trace = "e43d7f69-ca6a-4e21-b776-8ab553f5accc"
  }
}

# unknown

resource "aws_lb" "gateway" {
  name               = "glb"
  load_balancer_type = "gateway"

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "44cb68f7-7d25-4cf8-940f-35cab9f58431"
  }
}

