# pass

resource "aws_elasticache_cluster" "enabled" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"

  snapshot_retention_limit = 5
  tags = {
    yor_trace = "d5b8e5cf-8e28-414d-802f-474d00c20053"
  }
}

# failure

resource "aws_elasticache_cluster" "default" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
  tags = {
    yor_trace = "4e32a243-5b3c-4ca0-88a3-278508d4e507"
  }
}

resource "aws_elasticache_cluster" "disabled" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"

  snapshot_retention_limit = 0
  tags = {
    yor_trace = "6205aaf6-e33f-4b2e-86e1-ea27a9b94da4"
  }
}

# unknown

resource "aws_elasticache_cluster" "memcached" {
  cluster_id           = "cluster"
  engine               = "memcached"
  node_type            = "cache.m5.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.memcached1.6 "
  tags = {
    yor_trace = "5d4e7cfe-833c-452c-8d8c-ae1ddc65abd8"
  }
}
