resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    yor_trace = "80b28ebf-5408-47ce-8b12-695041751726"
  }
}