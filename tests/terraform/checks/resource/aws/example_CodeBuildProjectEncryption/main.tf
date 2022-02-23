resource "aws_codebuild_project" "fail" {
  name = "fail-project"
  artifacts {
    type                = S3
    encryption_disabled = true
  }

  tags = {
    yor_trace = "eaa04ac6-3371-4773-a823-bbc53139562a"
  }
}

resource "aws_codebuild_project" "no_artifacts_encryption_ignored" {
  name = "no-art-project"
  artifacts {
    type                = "NO_ARTIFACTS"
    encryption_disabled = true
  }
  tags = {
    yor_trace = "fb965e65-4602-466f-a358-f48c09bc31cd"
  }
}

resource "aws_codebuild_project" "success_no_encryption_disabled" {
  name = "default-project"
  artifacts {
    type = "S3"
  }
  tags = {
    yor_trace = "1abb993d-7db5-4b86-bace-07a549c2ecd7"
  }
}

resource "aws_codebuild_project" "success" {
  name = "success-project"
  artifacts {
    type                = "S3"
    encryption_disabled = false
  }
  tags = {
    yor_trace = "f564b56a-fb46-45e9-844f-d18dcebac856"
  }
}
