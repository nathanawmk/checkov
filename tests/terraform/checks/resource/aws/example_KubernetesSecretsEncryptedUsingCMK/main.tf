# pass

resource "aws_eks_cluster" "enabled" {
  name     = "eks"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  encryption_config {
    resources = ["secrets"]
    provider {
      key_arn = var.key_arn
    }
  }
  tags = {
    yor_trace = "431c953d-5a45-4311-9997-3869ec6d554a"
  }
}

# failure

resource "aws_eks_cluster" "default" {
  name     = "eks"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
  tags = {
    yor_trace = "46a6a1a1-7450-4301-9e84-e4bdda9e4b1f"
  }
}

# unknown

resource "aws_eks_cluster" "not_secrets" {
  name     = "eks"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  encryption_config {
    resources = ["something"]
    provider {
      key_arn = var.key_arn
    }
  }
  tags = {
    yor_trace = "926ac4b6-85aa-4ee3-ad3f-7226f455323b"
  }
}
