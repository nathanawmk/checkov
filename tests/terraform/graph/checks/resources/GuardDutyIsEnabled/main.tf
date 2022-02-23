resource "aws_guardduty_detector" "ok" {
  enable = true
  tags = {
    yor_trace = "6bb2cde7-ce7e-45e2-9876-801075033ded"
  }
}

resource "aws_guardduty_detector" "not_ok" {
  enable = true
  tags = {
    yor_trace = "15fc16de-24d5-434f-8af0-81cdc611b40f"
  }
}

resource "aws_guardduty_organization_configuration" "example" {
  auto_enable = true
  detector_id = aws_guardduty_detector.ok.id
}

resource "aws_guardduty_detector" "not_ok_false" {
  enable = true
  tags = {
    yor_trace = "9356fff3-8993-448e-8551-190b92f3485c"
  }
}

resource "aws_guardduty_organization_configuration" "example" {
  auto_enable = false
  detector_id = aws_guardduty_detector.not_ok_false.id
}