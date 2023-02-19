provider "google" {
  credentials = file("autonomous-time-372017-540ae5bc8ab9.json")
  project     = "autonomous-time-372017"
  region      = "us-west1"
  zone        = "us-west1-b"
}
