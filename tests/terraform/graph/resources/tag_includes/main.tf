resource "aws_instance" "some_instance" {
  ami           = "some_ami"
  instance_type = "t3.nano"
  tags = {
    Name      = "acme-machine"
    yor_trace = "989908cf-130c-4b5b-bd12-8f5bd2e7821f"
  }
}

resource "aws_subnet" "acme_subnet" {
  cidr_block = ""
  vpc_id     = ""

  tags = {
    acme      = "true"
    Name      = "notacme-subnet"
    yor_trace = "f683dd7f-a494-44bc-999c-b587d10dade9"
  }
}

resource "aws_s3_bucket" "acme_s3_bucket" {
  bucket = "acme-123456"
  tags = {
    Environment = "dev"
    yor_trace   = "b30b6be0-d161-4f29-9f20-ae7cfe010fce"
  }
}