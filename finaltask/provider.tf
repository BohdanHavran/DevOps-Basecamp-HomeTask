provider "google" {
  credentials = file("Your credentials")
  project     = "Your GCP project"
  region      = "us-west1"
  zone        = "us-west1-b"
}
