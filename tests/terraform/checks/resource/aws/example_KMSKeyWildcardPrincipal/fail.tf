resource "aws_kms_key" "fail_0" {
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
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "kms:*",
      "Resource": "*"
    },   
  ]
}
POLICY  
  tags = {
    yor_trace = "0b0ed676-ac8e-4814-8112-f363c0e6298e"
  }
}

resource "aws_kms_key" "fail_1" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","*"],
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "7c40b47e-201d-4eef-a9b9-d857d85ad6f1"
  }
}

resource "aws_kms_key" "fail_2" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "73ff0a1b-ede5-4dc1-89da-ee7be5dfefc3"
  }
}

resource "aws_kms_key" "fail_3" {
  description = "description"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": ["foo","*"],
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY  
  tags = {
    yor_trace = "93885a0a-c973-4db2-8354-14d0e100d793"
  }
}

resource "aws_kms_key" "fail_4" {
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
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [ 
          "arn:aws:iam::111122223333:root",
          "*"
        ]
      },
      "Action": "kms:*",
      "Resource": "*"
    }   
  ]
}
POLICY  
  tags = {
    yor_trace = "64688d1c-6a8e-4186-8bff-3f1bbc82d28a"
  }
}
