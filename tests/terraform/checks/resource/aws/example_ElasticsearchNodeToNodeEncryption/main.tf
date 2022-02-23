# pass
resource "aws_elasticsearch_domain" "without_cluster_config" {
  domain_name = "without_cluster_config"
  tags = {
    yor_trace = "bd74f79a-9b92-4efd-ad64-d38daca009e3"
  }
}

resource "aws_elasticsearch_domain" "without_instance_count" {
  domain_name = "without_instance_count"

  cluster_config {}
  tags = {
    yor_trace = "5e8b8fa6-bae0-498a-9ea6-0cbd47daea3f"
  }
}

resource "aws_elasticsearch_domain" "instance_count_not_bigger_than_1" {
  domain_name = "instance_count_not_bigger_than_1"

  cluster_config {
    instance_count = 1 // a value <= 1
  }
  tags = {
    yor_trace = "806b4514-8e78-44c6-b46a-8cea041403ae"
  }
}

resource "aws_elasticsearch_domain" "node_to_node_encryption_enabled" {
  domain_name = "node_to_node_encryption_enabled"

  cluster_config {
    instance_count = 2 // a value > 1
  }

  node_to_node_encryption {
    enabled = true
  }
  tags = {
    yor_trace = "345becfb-1911-40fb-9d84-0d94f758d7d1"
  }
}

resource "aws_elasticsearch_domain" "old_hcl" {
  domain_name = "old_hcl"

  cluster_config = {
    instance_count = 2
  }

  node_to_node_encryption = {
    enabled = true
  }
  tags = {
    yor_trace = "7eda809e-3bcf-4cfe-bd79-9e015f3d67be"
  }
}

# fail
resource "aws_elasticsearch_domain" "node_to_node_encryption_disabled" {
  domain_name = "node_to_node_encryption_disabled"

  cluster_config {
    instance_count = 2 // a value > 1
  }

  node_to_node_encryption {
    enabled = false
  }
  tags = {
    yor_trace = "b1ce97eb-d9f9-451d-b3ed-1ebfceabcb41"
  }
}

resource "aws_elasticsearch_domain" "node_to_node_encryption_doesnt_exist" {
  domain_name = "node_to_node_encryption_doesnt_exist"

  cluster_config {
    instance_count = 2 // a value > 1
  }
  tags = {
    yor_trace = "0bd9da7f-888e-4234-aef5-3f36ca25d68a"
  }
}

# unknown
resource "aws_elasticsearch_domain" "instance_count_not_number" {
  domain_name = "instance_count_not_number"

  cluster_config {
    instance_count = "not_int"
  }
  tags = {
    yor_trace = "e9b7e68d-497e-4b75-be10-2b76d7cc6347"
  }
}