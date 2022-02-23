resource "aws_instance" {
  ami           = "amiid"
  instance_type = "t3.micro"
  tags = {
    yor_trace = "7a43079a-01f6-46c1-9902-dde6551be575"
  }
}
