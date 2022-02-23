resource "aws_eks_cluster" "example_direct" {
  name                      = "example"
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  tags = {
    yor_trace = "1a6ee52f-b12f-450b-a546-48f6cea88a76"
  }
}

resource "aws_eks_cluster" "example_var" {
  name                      = "example"
  enabled_cluster_log_types = var.log_types_enabled
  tags = {
    yor_trace = "b6b05efc-95ca-4182-9c8e-123c84d05571"
  }
}

variable "log_types_enabled" {
  type    = list(string)
  default = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}