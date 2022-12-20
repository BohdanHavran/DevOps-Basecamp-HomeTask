# Instance Database
resource "google_compute_instance" "database" {
  name                    = "database-server"
  machine_type            = "g1-small"
  tags                    = ["ssh", "internal"]
  metadata_startup_script = file("database.sh")
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }
  network_interface {
    network    = google_compute_network.custom-network.id
    subnetwork = google_compute_subnetwork.custom-subnet.id
    access_config {
    }
  }
}
