resource "aws_vpc" "ok_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "250d5f9d-0c8d-4a2c-821c-5fd212fcde3e"
  }
}

resource "aws_network_acl" "acl_ok_optionA" {
  vpc_id = aws_vpc.ok_vpc.id
  tags = {
    yor_trace = "93b35142-b7df-4ffb-a22b-f68c7ccea9ce"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.ok_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    yor_trace = "db2cd0e3-b045-4dc8-9955-928e28aabea0"
  }
}

resource "aws_subnet" "main_optionB" {
  cidr_block = "10.0.1.0/24"
  tags = {
    yor_trace = "a008d0db-b92a-4dc2-9511-03c386cdc461"
  }
}

resource "aws_network_acl" "acl_ok_optionB" {
  vpc_id     = aws_vpc.ok_vpc.id
  subnet_ids = [aws_subnet.main_optionB.id]
  tags = {
    yor_trace = "ad491fd7-eb75-4e7b-b06c-55d76346547e"
  }
}


resource "aws_vpc" "bad_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "dc1df22b-6852-4a48-8ba5-bb51041bfae5"
  }
}


resource "aws_network_acl" "acl_bad_A" {
  vpc_id = aws_vpc.bad_vpc.id
  tags = {
    yor_trace = "fc60d3d8-cf56-43a2-b998-58428e737799"
  }
}

resource "aws_network_acl" "acl_bad_B" {

  tags = {
    yor_trace = "d898a7c7-2d47-408a-b564-decafa743133"
  }
}

resource "aws_vpc" "no_nacl_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "07096dc7-14af-4874-9a32-d81d44ae8900"
  }
}

