resource "aws_emr_cluster" "cluster_ok" {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"
  applications  = ["Spark"]

  ec2_attributes {
    emr_managed_master_security_group = aws_security_group.block_access_ok.id
    emr_managed_slave_security_group  = aws_security_group.block_access_ok.id
    instance_profile                  = "connected_to_aws_iam_instance_profile"
  }
  tags = {
    yor_trace = "314b513f-19a3-4d8d-b850-988e707ba2a3"
  }
}

resource "aws_security_group" "block_access_ok" {
  name        = "block_access"
  description = "Block all traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.1/10"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.10/10"]
  }
  tags = {
    yor_trace = "d1177f1e-7c65-41ec-b58e-ac4cbce58d93"
  }
}

resource "aws_emr_cluster" "cluster_not_connected" {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"
  applications  = ["Spark"]

  ec2_attributes {
    instance_profile = "connected_to_aws_iam_instance_profile"
  }
  tags = {
    yor_trace = "f4855050-4ea5-4d7a-9c0d-c4bbeccf1437"
  }
}


resource "aws_emr_cluster" "cluster_connected_to_wrong_group" {
  name          = "emr-test-arn"
  release_label = "emr-4.6.0"
  applications  = ["Spark"]

  ec2_attributes {
    emr_managed_master_security_group = aws_security_group.block_access_not_ok.id
    emr_managed_slave_security_group  = aws_security_group.block_access_not_ok.id
    instance_profile                  = "connected_to_aws_iam_instance_profile"
  }
  tags = {
    yor_trace = "22bb789e-b67c-492d-bc09-e06f3498f0b1"
  }
}

resource "aws_security_group" "block_access_not_ok" {
  name        = "block_access"
  description = "Block all traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "625f3f00-6008-44d4-bad0-422b3cf68b0d"
  }
}
