resource "aws_iam_policy" "policy" {
  name        = "my_policy-123456789101"
  path        = "/"
  description = "My test policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:iam::${var.aws_account_id}:role/admin"
    }
  ]
}
EOF
  tags = {
    yor_trace = "eb471a6c-80a2-42cf-b422-79fe8cc66849"
  }
}