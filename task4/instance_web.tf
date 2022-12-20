resource "google_compute_instance" "web" {
  name                    = "web-server"
  machine_type            = "g1-small"
  tags                    = ["ssh", "http", "internal"]
  metadata_startup_script = file("start_web.sh")
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }
  network_interface {
    network    = google_compute_network.custom-test.id
    subnetwork = google_compute_subnetwork.subnet-with-logging.id
    access_config {
    }
  }
}
