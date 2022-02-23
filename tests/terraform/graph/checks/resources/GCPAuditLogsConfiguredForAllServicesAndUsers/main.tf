resource "google_project" "project_good" {
  name       = "good"
  project_id = "123456"
  labels = {
    yor_trace = "06caad6b-bb49-414d-9d33-25d247bbf30d"
  }
}

resource "google_project" "project_bad_1" {
  name       = "bad1"
  project_id = "123456"
  labels = {
    yor_trace = "bb3776f0-190c-400b-9c31-4b8cbdca19de"
  }
}

resource "google_project" "project_bad_2" {
  name       = "bad2"
  project_id = "123456"
  labels = {
    yor_trace = "b39aaaa5-7cda-4197-b069-985837f217a4"
  }
}

resource "google_project" "project_bad_3" {
  name       = "bad3"
  project_id = "123456"
  labels = {
    yor_trace = "35a466eb-d5ad-419e-a03d-46f22c8092bb"
  }
}

resource "google_project_iam_audit_config" "project_good_audit" {
  project = google_project.project_good.id
  service = "allServices"
  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
  }
}

resource "google_project_iam_audit_config" "project_bad_audit_1" {
  project = google_project.project_bad_1.id
  service = "allServices"
  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
    exempted_members = [
      "user:joebloggs@hashicorp.com",
    ]
  }
}

resource "google_project_iam_audit_config" "project_bad_audit_2" {
  project = google_project.project_bad_2.id
  service = "someService"
  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
  }
}