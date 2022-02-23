resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    Env       = "prod"
    yor_trace = "946a785e-733e-450c-a6f1-e3be45e70f38"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name      = "tf-example"
    Env       = "prod"
    yor_trace = "85519d15-896f-48f4-842d-31cc0edd599b"
  }
}

resource "aws_network_interface" "network_interface_foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name      = "primary_network_interface"
    Env       = "prod"
    yor_trace = "fbc52b11-ace7-47cd-9be6-a8bc88c34d7e"
  }
}

resource "aws_network_interface" "network_interface_goo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name      = "secondary_network_interface"
    Env       = "dev"
    yor_trace = "3229edb4-2b0a-4621-bd61-9e377920f8f2"
  }
}

resource "aws_instance" "instance_foo" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.network_interface_foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
  tags = {
    yor_trace = "ac943d26-7a62-4e3a-8936-2e483d7c3618"
  }
}

resource "aws_instance" "instance_bar" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = {
    Env       = "prod"
    yor_trace = "20b0cd4c-5df7-49c2-b2ad-0a74f82cec68"
  }
}

resource "aws_vpc" "other_vpc" {
  cidr_block = "124.16.0.0/16"

  tags = {
    Name      = "not_connected"
    yor_trace = "9216a990-426d-4c38-89ac-d88faedbd8aa"
  }
}