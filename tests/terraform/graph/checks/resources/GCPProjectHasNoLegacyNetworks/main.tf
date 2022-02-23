resource "google_project" "project_good_1" {
  name       = "My Project"
  project_id = "good"
  org_id     = "1234567"
  labels = {
    yor_trace = "40045e87-655f-4e67-b3fe-a30d29f584ce"
  }
}

resource "google_project" "project_good_2" {
  name       = "My Project"
  project_id = "good"
  org_id     = "1234567"
  labels = {
    yor_trace = "a8ba618d-f4ca-4134-b5aa-e0feba1f915c"
  }
}

resource "google_project" "project_bad_1" {
  name       = "My Project"
  project_id = "bad"
  org_id     = "1234567"
  labels = {
    yor_trace = "5a55b6b7-67b9-4d75-b557-37d373325bb7"
  }
}

resource "google_compute_network" "vpc_network_network" {
  name                    = "vpc-legacy"
  auto_create_subnetworks = true
  project                 = google_project.project_bad_1.id
}

resource "google_compute_network" "vpc_network_1" {
  name    = "vpc-legacy"
  project = google_project.project_good_1.id
}

resource "google_compute_network" "vpc_network_2" {
  name                    = "vpc-legacy"
  project                 = google_project.project_good_1.id
  auto_create_subnetworks = false
}