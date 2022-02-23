# pass

resource "aws_lb" "enabled" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  enable_cross_zone_load_balancing = true
  tags = {
    yor_trace = "2160f353-cddf-4974-ba8f-c07c91cf637a"
  }
}

resource "aws_alb" "enabled" {
  load_balancer_type = "gateway"
  name               = "glb"

  enable_cross_zone_load_balancing = true

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "be7e62e9-fc91-4db7-aa97-7e971ffa68b3"
  }
}

# failure

resource "aws_lb" "default" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "e12e369f-f895-4a4c-a26b-eb296ab60374"
  }
}

resource "aws_alb" "default" {
  load_balancer_type = "gateway"
  name               = "glb"

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "e4da4fba-80c1-41b2-9f39-9835daec59ed"
  }
}

resource "aws_lb" "disabled" {
  internal           = false
  load_balancer_type = "network"
  name               = "nlb"
  subnets            = var.public_subnet_ids

  enable_cross_zone_load_balancing = false
  tags = {
    yor_trace = "280dc97d-cc2b-413f-8e32-da7456f010ba"
  }
}

resource "aws_alb" "disabled" {
  load_balancer_type = "gateway"
  name               = "glb"

  enable_cross_zone_load_balancing = false

  subnet_mapping {
    subnet_id = var.subnet_id
  }
  tags = {
    yor_trace = "75121c2d-ea1b-4831-9228-4c8e4b4001c3"
  }
}

# unknown

resource "aws_lb" "application" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "dfb92f3e-98fc-48a4-aa8b-ab9502a6e564"
  }
}

resource "aws_lb" "default_type" {
  internal = false
  name     = "alb"
  subnets  = var.public_subnet_ids
  tags = {
    yor_trace = "00353dfe-34a2-4504-9e36-d3ee146b1697"
  }
}
