resource "google_dns_managed_zone" "private1" {
  # No result because visibility is private
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "private"

  labels = {
    yor_trace = "1e624b18-07bd-4713-9189-5b8587db82ce"
  }
}

resource "google_dns_managed_zone" "private2" {
  # No result because visibility is private
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "private"

  dnssec_config {
    state = "on"
  }

  labels = {
    yor_trace = "9de72301-7839-4ae9-b58c-4459766944f0"
  }
}

resource "google_dns_managed_zone" "private3" {
  # No result because visibility is private
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "private"

  dnssec_config {
    state = "off"
  }

  labels = {
    yor_trace = "32121cf3-c514-4daf-a981-69b4a305677b"
  }
}

resource "google_dns_managed_zone" "pass1" {
  # Pass because visibility is public and value is set
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "public"

  dnssec_config {
    state = "on"
  }

  labels = {
    yor_trace = "eea16d12-4401-459c-ab9c-e1c97b42d2d8"
  }
}

resource "google_dns_managed_zone" "pass2" {
  # Pass because visibility is public (by default) and value is set
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  dnssec_config {
    state = "on"
  }

  labels = {
    yor_trace = "8f6872f5-0637-44e6-9771-576193991e29"
  }
}

resource "google_dns_managed_zone" "fail1" {
  # Fail because visibility is public and dnssec block is missing
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "public"

  labels = {
    yor_trace = "85a80f42-f05c-4826-8edb-44e2543c2056"
  }
}

resource "google_dns_managed_zone" "fail2" {
  # Fail because visibility is public and value is off
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "public"
  dnssec_config {
    state = "off"
  }
  labels = {
    yor_trace = "2a8a024a-204d-40ee-b569-7342d2a1a1aa"
  }
}

resource "google_dns_managed_zone" "fail3" {
  # Fail because visibility is public (by default) and value is off
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  dnssec_config {
    state = "off"
  }
  labels = {
    yor_trace = "44c374fc-01e0-47f9-92c9-2598a8118ce8"
  }
}