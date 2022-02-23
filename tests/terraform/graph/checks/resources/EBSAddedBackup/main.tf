resource "aws_ebs_volume" "ebs_good" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = {
    Name      = "HelloWorld"
    yor_trace = "4a32b300-4364-4d49-934f-468fb5e1863e"
  }
}

resource "aws_ebs_volume" "ebs_bad" {
  availability_zone = "us-west-2a"
  size              = 40

  tags = {
    Name      = "HelloWorld"
    yor_trace = "f0668acf-7152-46e7-825a-555d8a69b704"
  }
}

resource "aws_backup_selection" "backup_good" {
  iam_role_arn = "arn"
  name         = "tf_example_backup_selection"
  plan_id      = "123456"

  resources = [
    aws_ebs_volume.ebs_good.arn
  ]
}

resource "aws_backup_selection" "backup_bad" {
  iam_role_arn = "arn"
  name         = "tf_example_backup_selection"
  plan_id      = "123456"

  resources = [
  ]
}
