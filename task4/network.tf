resource "google_compute_subnetwork" "custom-subnet" {
  name          = "subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.custom-network.id

}

resource "google_compute_network" "custom-network" {
  name                    = "custom-network"
  auto_create_subnetworks = false
}
