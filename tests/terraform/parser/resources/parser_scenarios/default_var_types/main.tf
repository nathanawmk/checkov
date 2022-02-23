variable "map_with_default" {
  type    = map(string)
  default = { x = "123" }
}

variable "map_without_default" {
  type = map(string)
}

variable "map_with_default_no_type" {
  type    = map
  default = { x = "123" }
}

variable "map_without_default_no_type" {
  type = map
}

variable "list_with_default" {
  type    = list(string)
  default = ["123"]
}

variable "list_without_default" {
  type = list(string)
}


resource "google_compute_instance" "a" {
  metadata = merge(var.map_with_default, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "7b9cef80-7da1-4273-83a7-3a3a9d7cab94"
  }
}

resource "google_compute_instance" "b" {
  metadata = merge(var.map_without_default, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "aa3cc5e2-b82b-4cef-8c6c-0cd70ff7b983"
  }
}

resource "google_compute_instance" "c" {
  metadata = merge(var.map_with_default_no_type, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "3ad5626e-0196-4da7-ab67-8e375cb02e9e"
  }
}

resource "google_compute_instance" "d" {
  metadata = merge(var.map_without_default_no_type, { block-project-ssh-keys = true })
  labels = {
    yor_trace = "01f46cb3-7f2c-4487-8215-125db41fbacb"
  }
}

resource "google_compute_instance" "e" {
  metadata = concat(var.list_with_default, ["xyz"])
  labels = {
    yor_trace = "b7e1e0ea-d9bb-4af2-9482-8281c765366b"
  }
}

resource "google_compute_instance" "f" {
  metadata = concat(var.list_without_default, ["xyz"])
  labels = {
    yor_trace = "a62679dd-e066-400f-857e-b5c04b2980c1"
  }
}
