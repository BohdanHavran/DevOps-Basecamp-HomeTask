# Subnet
resource "google_compute_subnetwork" "custom-subnet" {
  name          = "subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.custom-network.id

}
# Network
resource "google_compute_network" "custom-network" {
  name                    = "custom-network"
  auto_create_subnetworks = false
}

resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.custom-network.id
}
resource "google_service_networking_connection" "private_vpc_connection" {

  network                 = google_compute_network.custom-network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}
