resource "google_logging_organization_sink" "org_sink_good_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  org_id      = "123456789"
  destination = google_storage_bucket.log_bucket_good.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_folder_sink" "folder_sink_good_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  folder      = "folder-name"
  destination = google_storage_bucket.log_bucket_good.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_folder_sink" "folder_sink_bad_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  folder      = "folder-name"
  destination = google_storage_bucket.log_bucket_bad_1.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_folder_sink" "folder_sink_bad_2" {
  name        = "my-sink"
  description = "some explaination on what this is"
  folder      = "folder-name"
  destination = google_storage_bucket.log_bucket_bad_2.name
  filter      = "resource.type = gce_instance AND severity >= WARNING"
}

resource "google_logging_project_sink" "project_sink_good_1" {
  name                   = "my-pubsub-instance-sink"
  destination            = google_storage_bucket.log_bucket_good.name
  filter                 = "resource.type = gce_instance AND severity >= WARNING"
  unique_writer_identity = true
}

resource "google_logging_project_sink" "project_sink_bad_1" {
  name                   = "my-pubsub-instance-sink"
  destination            = google_storage_bucket.log_bucket_bad_1.name
  filter                 = "resource.type = gce_instance AND severity >= WARNING"
  unique_writer_identity = true
}

resource "google_logging_project_sink" "project_sink_bad_2" {
  name                   = "my-pubsub-instance-sink"
  destination            = google_storage_bucket.log_bucket_bad_2.name
  filter                 = "resource.type = gce_instance AND severity >= WARNING"
  unique_writer_identity = true
}


resource "google_logging_organization_sink" "org_sink_bad_1" {
  name        = "my-sink"
  description = "some explaination on what this is"
  org_id      = "123456789"

  destination = google_storage_bucket.log_bucket_bad_1.name
}

resource "google_logging_organization_sink" "org_sink_bad_2" {
  name        = "my-sink"
  description = "some explaination on what this is"
  org_id      = "123456789"

  destination = google_storage_bucket.log_bucket_bad_2.name
}

resource "google_storage_bucket" "log_bucket_good" {
  name = "organization-logging-bucket"

  retention_policy {
    retention_period = 1000
    is_locked        = true
  }
  labels = {
    yor_trace = "136e89aa-f9e2-4f6d-8ec1-f0ec1d4e6b31"
  }
}


resource "google_storage_bucket" "log_bucket_bad_1" {
  name = "organization-logging-bucket"

  retention_policy {
    retention_period = 1000
    is_locked        = false
  }
  labels = {
    yor_trace = "34bcd713-18ba-4c39-97e0-6cc5404daded"
  }
}

resource "google_storage_bucket" "log_bucket_bad_2" {
  name = "organization-logging-bucket"

  retention_policy {
    retention_period = 1000
  }
  labels = {
    yor_trace = "d820aeb2-e686-4c39-b4a8-ff0c78d598c0"
  }
}
