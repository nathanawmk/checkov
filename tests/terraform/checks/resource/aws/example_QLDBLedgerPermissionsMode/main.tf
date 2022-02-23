# pass

resource "aws_qldb_ledger" "standard" {
  name             = "ledger"
  permissions_mode = "STANDARD"
  tags = {
    yor_trace = "d588663a-ec41-4012-bc22-018abcecad86"
  }
}

# failure

resource "aws_qldb_ledger" "allow_all" {
  name             = "ledger"
  permissions_mode = "ALLOW_ALL"
  tags = {
    yor_trace = "9057ebf2-0c44-4538-aafc-5de48340df29"
  }
}
