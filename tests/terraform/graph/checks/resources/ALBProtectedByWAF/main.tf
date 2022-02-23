resource "aws_lb" "lb_good_1" {
  internal = false
  tags = {
    yor_trace = "dc02440a-0fbe-44ea-b6d4-c1fdae00124b"
  }
}

resource "aws_lb" "lb_good_2" {
  internal = false
  tags = {
    yor_trace = "a5666d9a-b144-473b-a961-14a5f3371308"
  }
}

resource "aws_wafregional_web_acl_association" "foo" {
  resource_arn = aws_lb.lb_good_1.arn
  web_acl_id   = aws_wafregional_web_acl.foo.id
}

resource "aws_wafv2_web_acl_association" "bar" {
  resource_arn = aws_lb.lb_good_2.arn
  web_acl_arn  = aws_wafv2_web_acl.bar.arn
}

//public no WAF
resource "aws_lb" "lb_bad_1" {
  internal = false
  tags = {
    yor_trace = "232e2e18-ec8d-400e-bc27-1f9acc179a55"
  }
}

//internal should ignore
resource "aws_lb" "ignore" {
  internal = true
  tags = {
    yor_trace = "f3e7c224-c0ad-4e0e-a6a5-f3a5f1261547"
  }
}

//public internal not set (takes default - public)
resource "aws_lb" "lb_bad_2" {
  tags = {
    yor_trace = "e76ab09f-f028-4989-b657-51620053e97a"
  }
}

