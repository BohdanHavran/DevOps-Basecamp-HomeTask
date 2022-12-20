# Allow http
resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.custom-network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}
# Allow ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.custom-network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
# Allow internal
resource "google_compute_firewall" "allow-internal" {
  name    = "allow-internal"
  network = google_compute_network.custom-network.name
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }
  source_ranges = ["10.2.0.0/16"]
  target_tags   = ["internal"]
}
