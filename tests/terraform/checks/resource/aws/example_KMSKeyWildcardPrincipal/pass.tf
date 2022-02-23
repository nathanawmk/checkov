resource "aws_kms_key" "pass_0" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::111122223333:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "d1256c20-7a4d-478c-87e1-bdb7f497569f"
  }
}

resource "aws_kms_key" "pass_1" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": {
        "AWS": "*"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "27dcb009-7292-4359-86f9-0d223f815f4a"
  }
}

resource "aws_kms_key" "pass_2" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "foo",
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "babf557a-561c-4c66-a4a7-27fb4a5da9a8"
  }
}

resource "aws_kms_key" "pass_3" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","bar"],
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "ddccfefc-2ff3-4a5a-9158-8889c018414f"
  }
}
