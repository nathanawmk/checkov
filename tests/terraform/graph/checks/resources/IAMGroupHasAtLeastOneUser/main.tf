resource "aws_iam_group_membership" "ok_group" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.user_one.name,
    aws_iam_user.user_two.name,
  ]

  group = aws_iam_group.group.name
}

resource "aws_iam_group" "group" {
  name = "test-group"
}

resource "aws_iam_user" "user_one" {
  name = "test-user"
  tags = {
    yor_trace = "564d3bc3-1458-4d23-9aba-654c9e03c4b0"
  }
}

resource "aws_iam_user" "user_two" {
  name = "test-user-two"
  tags = {
    yor_trace = "5c74e5e3-0519-49ff-ab71-f11a05f25661"
  }
}


resource "aws_iam_group_membership" "bad_group" {
  name = "tf-testing-group-membership"


  group = aws_iam_group.bad_group.name
}


resource "aws_iam_group" "bad_group" {
  name = "test-group"
}