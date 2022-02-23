resource "aws_iam_policy" "pass1" {
  name   = "pass1"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:ListBucket*",
        "s3:HeadBucket",
        "s3:Get*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::b1",
        "arn:aws:s3:::b1/*",
        "arn:aws:s3:::b2",
        "arn:aws:s3:::b2/*"
      ],
      "Sid": ""
    },
    {
      "Action": "s3:PutObject*",
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::b1/*",
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "0a2f1636-cc3d-4f33-94aa-fdc01384cfb9"
  }
}

resource "aws_iam_policy" "fail1" {
  name = "fail1"
  path = "/"
  # the policy doesn't actually make sense, but it tests checking arrays for *
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:HeadBucket",
        "*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::b1",
        "arn:aws:s3:::b1/*",
        "*"
      ],
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "bc58d115-5dd2-4598-a4cc-f35da53e914d"
  }
}

resource "aws_iam_policy" "fail2" {
  name   = "fail2"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "308d9d21-827f-4635-94cc-c452d6827e0d"
  }
}

resource "aws_iam_policy" "fail3" {
  name   = "fail3"
  path   = "/"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "5670529e-89ef-45fb-908c-072356810fd8"
  }
}

resource "aws_iam_policy" "fail4" {
  name = "fail4"
  path = "/"
  # implicit allow, not actually valid, but it's a default that we check
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "*",
      "Resource": "*",
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "d9bd9704-1c87-41bb-b65e-bfab15e7f074"
  }
}

resource "aws_iam_policy" "pass2" {
  name = "pass2"
  path = "/"
  # deny
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "*",
      "Effect": "Deny",
      "Resource": "*",
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    yor_trace = "4e3a6a83-a240-43ec-95ba-0146159cd4b1"
  }
}
