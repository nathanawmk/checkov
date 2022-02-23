resource "google_kms_key_ring" "keyring" {
  name     = "keyring-example"
  location = "global"
}


resource "google_kms_crypto_key" "key_good_1" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "f6499cad-949e-4b50-8817-f601fb98b8dd"
  }
}

resource "google_kms_crypto_key" "key_bad_1" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "ccaa12fc-d25e-436a-b317-ad001db278ea"
  }
}

resource "google_kms_crypto_key" "key_bad_2" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "6dc2eff3-0091-4fb1-839e-6abbe40dfa46"
  }
}

resource "google_kms_crypto_key_iam_member" "crypto_key_good" {
  crypto_key_id = google_kms_crypto_key.key_good_1.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "user:jane@example.com"
}

resource "google_kms_crypto_key_iam_member" "crypto_key_bad_1" {
  crypto_key_id = google_kms_crypto_key.key_bad_1.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "allUsers"
}

resource "google_kms_crypto_key_iam_member" "crypto_key_bad_2" {
  crypto_key_id = google_kms_crypto_key.key_bad_2.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"
  member        = "allAuthenticatedUsers"
}

resource "google_kms_crypto_key" "key_bad_2" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "6dc2eff3-0091-4fb1-839e-6abbe40dfa46"
  }
}

resource "google_kms_crypto_key" "key_good_2" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "159f565c-f9f9-4bed-805f-e98720c883ac"
  }
}

resource "google_kms_crypto_key" "key_bad_3" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "99f4b733-1f47-4a03-84e8-fdd56e938365"
  }
}

resource "google_kms_crypto_key" "key_bad_4" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
  labels = {
    yor_trace = "1468addc-15aa-4dae-8da9-803afd03ec74"
  }
}


resource "google_kms_crypto_key_iam_binding" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.key_good_2.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"

  members = [
    "user:jane@example.com",
  ]
}

resource "google_kms_crypto_key_iam_binding" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.key_bad_3.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"

  members = [
    "allUsers",
  ]
}

resource "google_kms_crypto_key_iam_binding" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.key_bad_4.id
  role          = "roles/cloudkms.cryptoKeyEncrypter"

  members = [
    "allAuthenticatedUsers",
  ]
}
