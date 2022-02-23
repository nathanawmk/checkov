module "submodule" {
  source = "submodule"
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = module.submodule.vpc_id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name      = "tf-example"
    yor_trace = "6178816b-20e8-4698-a48b-3ccb780cfa24"
  }
}