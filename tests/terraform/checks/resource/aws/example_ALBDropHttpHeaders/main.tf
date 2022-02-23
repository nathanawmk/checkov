# pass

resource "aws_lb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = true
  tags = {
    yor_trace = "f9f7366b-3160-480b-a43c-c3a6e043019c"
  }
}

resource "aws_alb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = true
  tags = {
    yor_trace = "7b922b49-bcdf-4abc-af17-9848d6a6b6d2"
  }
}

# failure

resource "aws_lb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "d71ee9bb-4793-4859-bbdc-2eee2de2901f"
  }
}

resource "aws_alb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "fb1818fa-491c-4c35-9cc0-39905f71efa9"
  }
}

resource "aws_lb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = false
  tags = {
    yor_trace = "819a76b0-cbaf-4a45-a18d-bf088dfdb13a"
  }
}

resource "aws_alb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  drop_invalid_header_fields = false
  tags = {
    yor_trace = "b5732794-6624-4cb5-af4c-f4aa2d6749f6"
  }
}

# unknown

resource "aws_lb" "network" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "befd7548-ef7b-49c2-9799-22ff317ea76e"
  }
}

resource "aws_lb" "gateway" {
  load_balancer_type = "gateway"
  name               = "glb"

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "722c4a2b-0b32-4d8a-afd1-fe32dfd40217"
  }
}
