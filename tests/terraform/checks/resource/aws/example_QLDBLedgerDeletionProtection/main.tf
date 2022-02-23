# pass

resource "aws_qldb_ledger" "default" {
  name             = "ledger"
  permissions_mode = "STANDARD"
  tags = {
    yor_trace = "b14feac4-ddd2-41a7-a504-9f6e34fcd1f1"
  }
}

resource "aws_qldb_ledger" "enabled" {
  name             = "ledger"
  permissions_mode = "STANDARD"

  deletion_protection = true
  tags = {
    yor_trace = "66ba129d-5622-4e46-8f44-4197dc3b0c27"
  }
}

# failure

resource "aws_qldb_ledger" "disabled" {
  name             = "ledger"
  permissions_mode = "STANDARD"

  deletion_protection = false
  tags = {
    yor_trace = "832509bd-c72b-4e79-b775-cb1f499fbe89"
  }
}
