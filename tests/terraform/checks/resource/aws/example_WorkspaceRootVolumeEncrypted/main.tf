resource "aws_workspaces_workspace" "pass" {
  directory_id = aws_workspaces_directory.main.id
  bundle_id    = data.aws_workspaces_bundle.bundle.id
  user_name    = var.user_name

  root_volume_encryption_enabled = true
  user_volume_encryption_enabled = var.user_volume_encryption_enabled
  volume_encryption_key          = var.volume_encryption_key

  workspace_properties {
    compute_type_name                         = "VALUE"
    user_volume_size_gib                      = 10
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

  tags = merge(var.common_tags, {
    yor_trace = "b75e72d5-4f1d-4428-8562-df176cdfaedc"
  })
}

resource "aws_workspaces_workspace" "fail" {
  directory_id = aws_workspaces_directory.main.id
  bundle_id    = data.aws_workspaces_bundle.bundle.id
  user_name    = var.user_name

  user_volume_encryption_enabled = var.user_volume_encryption_enabled
  volume_encryption_key          = var.volume_encryption_key

  workspace_properties {
    compute_type_name                         = "VALUE"
    user_volume_size_gib                      = 10
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

  tags = merge(var.common_tags, {
    yor_trace = "32a8799f-bb02-49b3-a93b-2ce344735228"
  })
}
