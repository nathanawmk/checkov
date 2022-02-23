# Resource names in this file are **important**
# Encrypted resources _must_ start their name with the word "encrypted"
resource aws_ecr_repository "encrypted_repo" {
  name = "nimtest-repo"
  encryption_configuration {
    encryption_type = "AES256"
  }
  tags = {
    yor_trace = "24e03317-c938-47d2-b148-78f217731bcd"
  }
}

resource aws_ecr_repository "unencrypted_repo" {
  name = "nimtest-repo-unencrypted"
  tags = {
    yor_trace = "6e83b337-7c28-43eb-b7ca-9e0c960a107e"
  }
}

resource "aws_neptune_cluster" "encrypted_neptune" {
  storage_encrypted   = true
  skip_final_snapshot = true
  tags = {
    yor_trace = "05b5c386-f024-4c7a-bb4b-187ead6dfbf9"
  }
}

resource "aws_neptune_cluster" "unencrypted_neptune" {
  storage_encrypted   = false
  skip_final_snapshot = true
  tags = {
    yor_trace = "ad390421-d2b1-4e07-bd9b-546502a99ce9"
  }
}

resource "aws_efs_file_system" "encrypted_file_system" {
  encrypted = true
  tags = {
    yor_trace = "17f9ea98-e827-4b2b-87be-1c6276a251f0"
  }
}

resource "aws_efs_file_system" "unencrypted_file_system" {
  tags = {
    yor_trace = "6af67b5c-bd6d-47b9-bcef-49d184619535"
  }
}

resource "aws_ebs_volume" "encrypted_volume" {
  availability_zone = "us-east-1a"
  encrypted         = true
  size              = 8
  tags = {
    yor_trace = "4d357798-f0c0-45af-baa9-70329030fb7d"
  }
}

resource "aws_ebs_volume" "unencrypted_volume" {
  availability_zone = "us-east-1a"
  size              = 8
  tags = {
    yor_trace = "54a81ceb-8db8-4bc7-bf3e-cc9a388f8af2"
  }
}

resource "aws_ebs_volume" "unencrypted_volume2" {
  availability_zone = "us-east-1a"
  encrypted         = false
  size              = 8
  tags = {
    yor_trace = "c92e204e-2bd0-42cb-8f1e-73121e2bf66f"
  }
}

resource "aws_elasticache_replication_group" "encrypted_replication_group" {
  replication_group_description = "nimtest replication group"
  replication_group_id          = "nimtest"
  at_rest_encryption_enabled    = true
  cluster_mode {
    num_node_groups         = 0
    replicas_per_node_group = 0
  }
  tags = {
    yor_trace = "939ee269-751d-46f0-a879-a4eac12401c7"
  }
}

resource "aws_elasticache_replication_group" "unencrypted_replication_group" {
  replication_group_description = "nimtest replication group"
  replication_group_id          = "nimtest"
  cluster_mode {
    num_node_groups         = 0
    replicas_per_node_group = 0
  }
  tags = {
    yor_trace = "a9e627c0-eaa8-4c44-829b-0aeb86ad1e32"
  }
}

resource "aws_elasticsearch_domain" "encrypted_domain" {
  domain_name = "nimtest-encryption-test"
  encrypt_at_rest {
    enabled = true
  }
  node_to_node_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "b2258102-32ce-47e5-bb32-fefa650cac63"
  }
}

resource "aws_elasticsearch_domain" "unencrypted_domain" {
  domain_name = "nimtest-encryption-test"
  node_to_node_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "41d1c6a2-4497-4adc-abb2-ce9fe676f252"
  }
}

resource "aws_msk_cluster" "encrypted_msk" {
  cluster_name           = ""
  kafka_version          = ""
  number_of_broker_nodes = 0
  broker_node_group_info {
    client_subnets  = []
    ebs_volume_size = 0
    instance_type   = ""
    security_groups = []
  }

  encryption_info {
    encryption_in_transit {
      in_cluster    = true
      client_broker = "TLS"
    }
    encryption_at_rest_kms_key_arn = "KMS"
  }
  tags = {
    yor_trace = "c2d738d5-c05c-4e66-a797-d5191e19217b"
  }
}

resource "aws_kinesis_stream" "encrypted_stream" {
  name            = "nimtest"
  shard_count     = 1
  encryption_type = "KMS"
  kms_key_id      = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "6afe7b82-088a-40e0-9721-bc309ff1a376"
  }
}

resource "aws_kinesis_stream" "unencrypted_stream" {
  name        = "nimtest"
  shard_count = 1
  tags = {
    yor_trace = "1b567b00-b7a6-4889-8502-dd5895105b36"
  }
}

resource "aws_s3_bucket" "unencrypted_bucket" {
  bucket = "unencrypted"
  tags = {
    yor_trace = "114371eb-0a57-475c-96cd-3c01b91f6883"
  }
}

resource "aws_s3_bucket" "encrypted_bucket" {
  bucket = "unencrypted"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
  tags = {
    yor_trace = "5e76600d-2e14-4567-ad2b-31e677288de9"
  }
}

resource "aws_s3_bucket" "encrypted_bucket_2" {
  bucket = "unencrypted"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    yor_trace = "2453c9a9-ef14-4bca-805a-d17e20949c83"
  }
}

resource "aws_s3_bucket_object" "encrypted_object_by_itself" {
  bucket = aws_s3_bucket.encrypted_bucket.bucket
  key    = "some-key.html"

  server_side_encryption = "AES256"
  tags = {
    yor_trace = "3c63035c-78cb-4507-8e6b-83f249fa62fe"
  }
}

resource "aws_s3_bucket_object" "unencrypted_object_by_bucket" {
  bucket = aws_s3_bucket.encrypted_bucket.bucket
  key    = "some-key.html"
  tags = {
    yor_trace = "5cd58aee-33e8-454b-bb0e-0b3bdc8553ba"
  }
}

resource "aws_sns_topic" "encrypted_topic" {
  name              = "encrypted"
  kms_master_key_id = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "9c1c7540-be6d-448a-b441-21f1024a115d"
  }
}

resource "aws_sns_topic" "unencrypted_topic" {
  name = "unencrypted"
  tags = {
    yor_trace = "051a8f80-11f5-4e16-b7ca-d4ecf181ea94"
  }
}

resource "aws_sqs_queue" "encrypted_queue" {
  name              = "encrypted"
  kms_master_key_id = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "5c57b554-ff37-49f4-8f4f-6e97577a1928"
  }
}

resource "aws_sqs_queue" "unencrypted_queue" {
  name = "unencrypted"
  tags = {
    yor_trace = "d6b8613b-759e-4f4f-b5db-54b580dce97d"
  }
}

resource "aws_cloudwatch_log_group" "encrypted_by_default_cloudwatch_log_group" {
  name = "group"
  tags = {
    yor_trace = "c801f193-db99-4af4-a89f-bd5123f4b2fa"
  }
}

resource "aws_cloudwatch_log_group" "encrypted" {
  name       = "group"
  kms_key_id = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "04d50b4d-66df-4691-9d3a-a3decd2818ac"
  }
}

resource "aws_cloudtrail" "encrypted" {
  name           = "encrypted"
  s3_bucket_name = aws_s3_bucket.encrypted_bucket.bucket
  kms_key_id     = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "cec749e5-550e-45f6-a0e2-dbe3dec2f533"
  }
}

resource "aws_cloudtrail" "unencrypted" {
  name           = "encrypted"
  s3_bucket_name = aws_s3_bucket.encrypted_bucket.bucket
  tags = {
    yor_trace = "e0d051b2-285f-4cee-942b-37dd684ce161"
  }
}

resource "aws_dynamodb_table" "encrypted" {
  name     = "encrypted"
  hash_key = ""
  attribute {
    name = ""
    type = ""
  }
  server_side_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "49c3154e-ce45-4630-9824-6a89233111eb"
  }
}

resource "aws_dynamodb_table" "encrypted_by_default_dynamodb_table" {
  name     = "encrypted_by_default"
  hash_key = ""
  attribute {
    name = ""
    type = ""
  }
  tags = {
    yor_trace = "93b88302-f2b1-4a25-8f14-e8a6db0de89f"
  }
}

resource "aws_iam_role" "role" {
  assume_role_policy = ""
  tags = {
    yor_trace = "151e4430-f361-4fd8-97cb-be2d111ffbb2"
  }
}

resource "aws_docdb_cluster" "encrypted_docdb" {
  storage_encrypted = true
  kms_key_id        = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "a911ae00-3c99-49b1-ad4b-639712592d41"
  }
}

resource "aws_docdb_cluster" "unencrypted_docdb" {
  storage_encrypted = false
  tags = {
    yor_trace = "9f9e3add-cc2f-40eb-8abc-9c86ca78e6fa"
  }
}

resource "aws_codebuild_project" "encrypted_project" {
  name         = "encrypted"
  service_role = ""
  artifacts {
    type = ""
  }
  environment {
    compute_type = ""
    image        = ""
    type         = ""
  }
  source {
    type = ""
  }

  encryption_key = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "58d84d99-b2e6-439b-8dd9-2bea8b78c339"
  }
}

resource "aws_codebuild_project" "unencrypted_project" {
  name         = "unencrypted"
  service_role = ""
  artifacts {
    type = ""
  }
  environment {
    compute_type = ""
    image        = ""
    type         = ""
  }
  source {
    type = ""
  }
  tags = {
    yor_trace = "121557e0-d0ac-4d8a-a11f-b0a0dd8e32f0"
  }
}

resource "aws_codebuild_report_group" "encrypted_report_group" {
  export_config {
    type = "S3"
    s3_destination {
      bucket              = "some-bucket"
      encryption_disabled = false
      encryption_key      = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
      packaging           = "NONE"
      path                = "/some/path"
    }
  }
  tags = {
    yor_trace = "22299bb3-df56-47d1-9164-a26180751897"
  }
}

resource "aws_codebuild_report_group" "unencrypted_report_group" {
  export_config {
    type = "S3"
    s3_destination {
      bucket              = "some-bucket"
      encryption_disabled = true
      packaging           = "NONE"
      path                = "/some/path"
    }
  }
  tags = {
    yor_trace = "0be36325-dbb1-4fd6-8903-eeff61896304"
  }
}

resource "aws_athena_database" "encrypted_athena_database" {
  bucket = ""
  name   = "encrypted"
  encryption_configuration {
    encryption_option = "SSE_S3"
  }
}

resource "aws_athena_database" "unencrypted_athena_database" {
  bucket = ""
  name   = "unencrypted"
}

resource "aws_athena_workgroup" "encrypted_workgroup" {
  name = "encrypted"
  configuration {
    result_configuration {
      encryption_configuration {
        encryption_option = "SSE_KMS"
        kms_key_arn       = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
      }
    }
  }
  tags = {
    yor_trace = "78e9e639-b219-4a2d-93ff-1b8082e1363c"
  }
}

resource "aws_athena_workgroup" "unencrypted_workgroup" {
  name = "unencrypted"
  tags = {
    yor_trace = "70153f2a-bec5-4e0d-a31d-72a19baab736"
  }
}

resource "aws_eks_cluster" "encrypted_eks" {
  name     = ""
  role_arn = ""
  vpc_config {
    subnet_ids = []
  }

  encryption_config {
    resources = []
    provider {
      key_arn = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
    }
  }
  tags = {
    yor_trace = "a5d12264-0d8c-44a3-b6a1-c06d2f48e3d4"
  }
}

resource "aws_db_instance" "encrypted_instance" {
  instance_class = ""

  storage_encrypted = true
  tags = {
    yor_trace = "3b044002-f7e1-40e5-8a46-efbbb9f1ee4f"
  }
}

resource "aws_db_instance" "unencrypted_instance" {
  instance_class = ""

  storage_encrypted = false
  tags = {
    yor_trace = "ee753f38-b39b-4fcf-b8ed-2ce473acf82f"
  }
}

resource "aws_rds_cluster" "encrypted_rds_cluster" {
  storage_encrypted = true
  kms_key_id        = "arn:aws:kms:us-east-1:000000000000:key/some-key-uuid"
  tags = {
    yor_trace = "15eb406b-9282-4087-bf79-7bfcc63fd59c"
  }
}

resource "aws_rds_cluster" "unencrypted_rds_cluster" {
  tags = {
    yor_trace = "0d53d160-f28d-4fc4-80b6-8ba92b9f2d0e"
  }
}

resource "aws_rds_global_cluster" "encrypted_global_rds" {
  global_cluster_identifier = "some-id"
  storage_encrypted         = true
}

resource "aws_rds_global_cluster" "unencrypted_global_rds" {
  global_cluster_identifier = "some-id"
  storage_encrypted         = false
}

resource "aws_s3_bucket_inventory" "encrypted_s3_inventory" {
  bucket                   = ""
  included_object_versions = ""
  name                     = ""
  destination {
    bucket {
      bucket_arn = ""
      format     = ""
      encryption {
        sse_s3 {}
      }
    }
  }
  schedule {
    frequency = ""
  }
}

resource "aws_dax_cluster" "encrypted_dax_cluster" {
  cluster_name       = "dax"
  iam_role_arn       = ""
  node_type          = ""
  replication_factor = 0
  server_side_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "6c7db8d5-8262-42bf-babf-5201a48f63da"
  }
}

resource "aws_dax_cluster" "unencrypted_dax_cluster" {
  cluster_name       = "dax"
  iam_role_arn       = ""
  node_type          = ""
  replication_factor = 0
  server_side_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "cc354c3f-8206-483a-ac7a-40f8138adf66"
  }
}

resource "aws_redshift_cluster" "encrypted_redshift_cluster" {
  cluster_identifier = "redshift"
  node_type          = ""
  encrypted          = true
  tags = {
    yor_trace = "950d5cc2-194d-4ecf-8068-596f3ed51c8d"
  }
}

resource "aws_redshift_cluster" "unencrypted_redshift_cluster" {
  cluster_identifier = "redshift"
  node_type          = ""
  tags = {
    yor_trace = "2b16e72a-fb4b-4b31-9e08-ad663c26b6eb"
  }
}
