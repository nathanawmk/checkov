# pass

resource "aws_iam_user" "pass" {
  name = "tech-user"
  tags = {
    yor_trace = "59e54e5f-ae59-44aa-ae43-02d6d01dd153"
  }
}

# fail

resource "aws_iam_user" "fail" {
  name = "human-user"
  tags = {
    yor_trace = "1bcaef0a-b0ad-462b-9cc3-86fa8b60a8b8"
  }
}

resource "aws_iam_user_login_profile" "fail" {
  user    = aws_iam_user.fail.name
  pgp_key = "keybase:human-user"
}
