resource "aws_rds_cluster" "rds_cluster_encrypted" {
  cluster_identifier = "some-encrypted-id"
  kms_key_id         = "some-kms-key-id"
  tags = {
    yor_trace = "29ff8ad5-aaf1-4e64-9364-ff98cb2da953"
  }
}

resource "aws_rds_cluster" "rds_cluster_unencrypted" {
  cluster_identifier = "some-unencrypted-id"
  tags = {
    yor_trace = "e7fc01d9-2c84-49dd-b33f-97bcecc317c8"
  }
}

resource "aws_s3_bucket" "encrypted_bucket" {
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    yor_trace = "6d322bbb-1b3c-4432-835c-494872eef22d"
  }
}

resource "aws_s3_bucket" "unencrypted_bucket" {
  versioning {
    enabled = True
  }
  tags = {
    yor_trace = "2ff16a43-80af-42b9-8308-e644a49de05b"
  }
}

resource "aws_neptune_cluster" "encrypted_neptune" {
  cluster_identifier = "encrypted-neptune"
  storage_encrypted  = true
  tags = {
    yor_trace = "02ef933d-e697-40df-8620-98aa469fdf15"
  }
}

resource "aws_neptune_cluster" "unencrypted_neptune" {
  cluster_identifier = "unencrypted-neptune"
  tags = {
    yor_trace = "71968e0d-8701-4769-b6ed-75b1fac58cdd"
  }
}
