#sql
resource "google_sql_database" "database" {
  name     = "wordpress"
  instance = google_sql_database_instance.instance.name
}


resource "google_sql_database_instance" "instance" {
  name             = "my-database-instance"
  region           = "us-west1"
  database_version = "MYSQL_8_0"
  depends_on       = [google_service_networking_connection.private_vpc_connection]
  settings {
    tier = "db-g1-small"

    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = google_compute_network.custom-network.id
      enable_private_path_for_google_cloud_services = true
      authorized_networks {
        name  = "wordpress"
        value = google_compute_instance.k8s.network_interface[0].access_config[0].nat_ip
      }

    }

  }
  deletion_protection = "false"
}

resource "google_sql_user" "user" {
  name     = "wordpress"
  password = "wordpress"
  instance = google_sql_database_instance.instance.name
}
