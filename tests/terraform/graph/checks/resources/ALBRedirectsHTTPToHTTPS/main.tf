resource "aws_lb" "lb_good_1" {
  tags = {
    yor_trace = "5fc88988-1e2b-4a3f-a7a0-8a6f7564f744"
  }
}

resource "aws_lb" "lb_good_2" {
  tags = {
    yor_trace = "dd5a27b2-8c1a-4b8e-a13e-ed0bf8421853"
  }
}

resource "aws_lb" "lb_good_3" {
  tags = {
    yor_trace = "088e2f39-6214-4f9f-81c2-57ab480422d2"
  }
}

resource "aws_lb" "lb_bad_1" {
  tags = {
    yor_trace = "4b018fa6-182d-4fcd-bf94-8b7e4ac8f343"
  }
}

resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "3726af61-32f6-4eb0-a89d-e1fd3d62dd5a"
  }
}


resource "aws_lb_listener" "listener_good_1" {
  load_balancer_arn = aws_lb.lb_good_1.arn
  port              = "443"
  protocol          = "HTTPS"

  default_action {
    type = "action"
  }
}

resource "aws_lb_listener" "listener_good_2" {
  load_balancer_arn = aws_lb.lb_good_2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_lb_listener" "listener_good_3" {
  load_balancer_arn = aws_lb.lb_good_3.arn
  port              = 80 #as an int
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }

  }
}

resource "aws_lb_listener" "listener_bad_1" {
  load_balancer_arn = aws_lb.lb_bad_1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

resource "aws_lb_listener" "listener_bad_2" {
  load_balancer_arn = aws_lb.lb_bad_2.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "some-action"
  }
}

