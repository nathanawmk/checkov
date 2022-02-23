resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name      = "tf-example"
    yor_trace = "e19c3705-ddb6-4f7f-ad1f-2d34f607e648"
  }
}

resource "aws_subnet" "subnet_public_ip" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "172.16.10.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name      = "first-tf-example"
    yor_trace = "c378bea4-b694-4194-b0ee-0ca9ed42c4ba"
  }
}

resource "aws_subnet" "subnet_not_public_ip" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name      = "second-tf-example"
    yor_trace = "3e05dbad-5a8c-41d1-bc0e-ca3cc64b530d"
  }
}


resource "aws_default_security_group" "default_security_group_open" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "98d45dc4-afee-483f-b5a9-b2da07136502"
  }
}

resource "aws_default_security_group" "default_security_group_closed" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "4049cfcc-4901-4c10-8bd7-e8ada2aabb47"
  }
}

resource "aws_instance" "with_open_def_security_groups" {
  ami           = "ami-0"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  security_groups = [aws_default_security_group.default_security_group_open.id]
  tags = {
    yor_trace = "7e7bceac-31cf-4ded-ade5-844584ca7278"
  }
}

resource "aws_instance" "with_closed_def_security_groups" {
  ami           = "ami-1"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  security_groups = [aws_default_security_group.default_security_group_closed.id]
  tags = {
    yor_trace = "db77e9d3-672e-4e95-97dd-004ac08efe69"
  }
}


resource "aws_instance" "with_open_security_groups" {
  ami           = "ami-2"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    yor_trace = "eadaf721-fbf1-4e25-89b9-692174389d42"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name      = "allow_tls"
    yor_trace = "61440b97-7d2c-40a4-ab39-5b2564c810c4"
  }
}


resource "aws_instance" "with_subnet_public" {
  ami           = "ami-3"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  subnet_id = aws_subnet.subnet_public_ip.id
  tags = {
    yor_trace = "72abd87b-48b4-4ebd-adf3-2af39ad46bf7"
  }
}

resource "aws_instance" "with_subnet_not_public" {
  ami           = "ami-4"
  instance_type = "t2.micro"

  credit_specification {
    cpu_credits = "unlimited"
  }

  subnet_id = aws_subnet.subnet_not_public_ip.id
  tags = {
    yor_trace = "7c8a479e-055f-4d37-b380-196794085a80"
  }
}