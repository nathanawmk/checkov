# pass

resource "aws_lb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = true
  tags = {
    yor_trace = "a3e3263d-acc3-495d-a10a-83a71914804a"
  }
}

resource "aws_alb" "enabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = true
  tags = {
    yor_trace = "7af65252-bf1e-4cff-bec3-6f734e59db20"
  }
}

# failure

resource "aws_lb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "ab92ad51-fcfc-4ec0-a58c-66cd38dcccec"
  }
}

resource "aws_alb" "default" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids
  tags = {
    yor_trace = "4da4e9af-c9e9-4092-a53e-fae577495dfc"
  }
}

resource "aws_lb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
  tags = {
    yor_trace = "f7568f98-5081-4195-86ff-2d52c05da842"
  }
}

resource "aws_alb" "disabled" {
  internal           = false
  load_balancer_type = "application"
  name               = "alb"
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
  tags = {
    yor_trace = "08e74db9-b2d7-46b6-a5d3-e3db744b0591"
  }
}
