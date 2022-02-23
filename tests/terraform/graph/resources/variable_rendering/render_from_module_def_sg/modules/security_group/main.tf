resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-123"

  ingress {
    description = "TLS from VPC"
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "allow_ssh"
    yor_trace = "e71877f1-0336-447c-8b61-bb8b8602e642"
  }
}