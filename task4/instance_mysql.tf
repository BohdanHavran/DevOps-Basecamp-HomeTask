resource "google_compute_instance" "mysql" {
  name                    = "mysql-server"
  machine_type            = "g1-small"
  tags                    = ["ssh", "http", "internal"]
  metadata_startup_script = <<-EOF
  #!/bin/bash
  sudo apt-get -y update
  sudo apt -y install mysql-client mysql-server
  sudo mysql -u root -proot << eof
  CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
  CREATE USER 'wordpressuser'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
  GRANT ALL ON wordpress.* TO 'wordpressuser'@'%';
  FLUSH PRIVILEGES;
  eof
  sudo ufw allow 3306
  sudo chmod -R 777 /etc/mysql
  sudo echo "[mysqld]
  bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
  sudo service mysql restart
  EOF
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
