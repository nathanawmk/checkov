resource "aws_eip" "ok_eip" {
  instance = aws_instance.ec2.id
  vpc      = true
  tags = {
    yor_trace = "9462cde8-2f64-468d-b573-02a50cf1a74a"
  }
}

resource "aws_instance" "ec2" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t2.micro"

  tags = {
    Name      = "HelloWorld"
    yor_trace = "e512b772-92c2-4e94-9383-d859854a2827"
  }
}

resource "aws_eip" "not_ok_eip" {
  vpc                       = true
  network_interface         = aws_network_interface.multi-ip.id
  associate_with_private_ip = "10.0.0.10"
  tags = {
    yor_trace = "841e0629-6a7d-4662-9f58-c825f6addc2e"
  }
}

# via aws_eip_association

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2_assoc.id
  allocation_id = aws_eip.ok_eip_assoc.id
}

resource "aws_instance" "ec2_assoc" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t2.micro"

  tags = {
    Name      = "Assoc"
    yor_trace = "efe4992a-be7e-4d0c-915f-6f239e47f889"
  }
}

resource "aws_eip" "ok_eip_assoc" {
  vpc = true
  tags = {
    yor_trace = "5b42a4b4-892b-4a48-8b7a-31bb7305f335"
  }
}

# via aws_nat_gateway

resource "aws_eip" "ok_eip_nat" {
  vpc = true
  tags = {
    yor_trace = "47262440-63b5-4961-b37b-41cc6e7c5b66"
  }
}

resource "aws_nat_gateway" "ok_eip_nat" {
  allocation_id = aws_eip.ok_eip_nat.id
  subnet_id     = "aws_subnet.public.id"
  tags = {
    yor_trace = "77c167f1-c00a-4627-a6ad-6e24387e40c3"
  }
}

resource "aws_eip" "ok_eip_module" {
  count    = 1
  instance = module.example[count.index].instance_id
  vpc      = true
  tags = {
    yor_trace = "94f76b9d-9b94-4ef6-bb31-f4c79c197078"
  }
}

resource "aws_eip" "ok_eip_data" {
  instance = data.aws_instance.id
  vpc      = true
  tags = {
    yor_trace = "9652594f-6cdd-4d25-90a9-8b24c58e3f67"
  }
}
