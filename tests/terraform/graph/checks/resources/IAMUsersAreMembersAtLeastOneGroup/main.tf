resource "aws_iam_group_membership" "ok_group" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_good.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "test-group"
}

resource "aws_iam_user" "user_good" {
  name = "test-user"
  tags = {
    yor_trace = "b7334b95-4ebf-4fb0-9655-424ec0eb46ba"
  }
}

resource "aws_iam_user" "user_bad" {
  name = "test-user-two"
  tags = {
    yor_trace = "de83463c-7281-4066-801b-6b7098d4e64c"
  }
}


resource "aws_iam_group_membership" "bad_group" {
  name  = "tf-testing-group-membership"
  users = []
  group = aws_iam_group.bad_group.name
}

resource "aws_iam_group" "bad_group" {
  name = "test-group"
}