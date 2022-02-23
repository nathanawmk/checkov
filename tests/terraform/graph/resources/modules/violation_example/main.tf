module "learn_terraform" {
  source  = "https://github.com/hashicorp/learn-terraform-provision-eks-cluster.git"
  version = "1.16.0"

  name = "s3-bucket"
}

resource "aws_s3_bucket" "destination" {
  bucket = "tf-test-bucket-destination-12345"
  versioning {
    enabled = var.enabled
  }
  tags = {
    yor_trace = "d754296a-d412-460e-aaa2-f4be9a27f68d"
  }
}