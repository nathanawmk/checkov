# fail
resource "aws_transfer_server" "example_public" {
  endpoint_type = "PUBLIC"
  protocols     = ["SFTP"]
  tags = {
    yor_trace = "0f0d50fd-3c71-4b4a-bbb2-09cb286cdefa"
  }
}

# pass
resource "aws_transfer_server" "example_vpc" {
  endpoint_type = "VPC"
  protocols     = ["SFTP"]
  tags = {
    yor_trace = "a237d9f5-a14c-4986-b65c-a69e347b2e9b"
  }
}

# fail
resource "aws_transfer_server" "example" {
  protocols = ["SFTP"]
  tags = {
    yor_trace = "d8185ee5-5471-47c8-93d0-2cfc0e68b428"
  }
}