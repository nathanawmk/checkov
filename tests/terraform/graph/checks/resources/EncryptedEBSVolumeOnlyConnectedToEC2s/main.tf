resource "aws_instance" "web" {
  ami               = "ami-21f78e11"
  availability_zone = "us-west-2a"
  instance_type     = "t2.micro"

  tags = {
    Name      = "HelloWorld"
    yor_trace = "f7198648-6ad5-4842-84bd-c22bc51ae768"
  }
}

resource "aws_volume_attachment" "not_ok_attachment1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.not_ok_ebs1.id
  instance_id = aws_instance.web.id
}

resource "aws_volume_attachment" "not_ok_attachment2" {
  device_name = "/dev/sdh2"
  volume_id   = aws_ebs_volume.not_ok_ebs2.id
  instance_id = aws_instance.web.id
}

resource "aws_volume_attachment" "ok_attachment1" {
  device_name = "/dev/sdh3"
  volume_id   = aws_ebs_volume.ok_ebs2.id
  instance_id = aws_instance.web.id
}

resource "aws_ebs_volume" "not_ok_ebs1" {
  availability_zone = ""
  tags = {
    yor_trace = "33dbe35b-c2c0-427a-9ff5-b3801a9ccf73"
  }
}

resource "aws_ebs_volume" "not_ok_ebs2" {
  availability_zone = ""
  encrypted         = false
  tags = {
    yor_trace = "8e6c2a35-a1d8-4b4e-8c55-cce2615d6f12"
  }
}

resource "aws_ebs_volume" "ok_ebs1" {
  availability_zone = ""
  tags = {
    yor_trace = "132b25cd-b348-46bc-9d52-63c3a6ba9908"
  }
}

resource "aws_ebs_volume" "ok_ebs2" {
  availability_zone = ""
  encrypted         = true
  tags = {
    yor_trace = "f259a647-bc22-4ab7-b405-3dfe1fb3fc07"
  }
}


resource "aws_volume_attachment" "ebs_at1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.not_ok_ebs1.id
  instance_id = aws_instance.web.id
}