resource "aws_redshift_cluster" "fail" {
  cluster_identifier  = "redshift-defaults-only"
  node_type           = "dc2.large"
  master_password     = "Test1234"
  master_username     = "test"
  skip_final_snapshot = true
  tags = {
    yor_trace = "44738b6b-6a2a-4b36-b177-239d626c9ad8"
  }
}

resource "aws_redshift_cluster" "pass" {
  cluster_identifier        = "redshift-defaults-only"
  node_type                 = "dc2.large"
  master_password           = "Test1234"
  master_username           = "test"
  skip_final_snapshot       = true
  cluster_subnet_group_name = "subnet-ebd9cead"
  tags = {
    yor_trace = "654671fe-e81e-49e8-b346-849cea1b60c3"
  }
}
