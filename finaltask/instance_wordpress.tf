# Instance Web
resource "google_compute_instance" "k8s" {
  name         = "k8s-server"
  machine_type = "e2-custom-4-8192"
  tags         = ["ssh", "http"]
  metadata = {
    ssh-keys = "${var.ssh_username}:${file("/home/${var.ssh_username}/.ssh/id_rsa.pub")}"
  }
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size  = "35"
    }
  }
  network_interface {
    network    = google_compute_network.custom-network.id
    subnetwork = google_compute_subnetwork.custom-subnet.id
    access_config {
    }
  }
  depends_on = [google_service_networking_connection.private_vpc_connection]
}
