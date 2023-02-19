##################################################### HARDENING
resource "local_file" "ssh_cfg" {
  content = templatefile("${path.module}/tpl/ansible/node.tpl",
    {
      user = "${var.ssh_username}"
      ssh  = "/home/${var.ssh_username}/.ssh/id_rsa"
    }
  )
  filename   = "ansible/group_vars/node"
  depends_on = [google_compute_instance.k8s, google_sql_database_instance.instance]
}
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/tpl/ansible/hosts.tpl",
    {
      web_public_ip = google_compute_instance.k8s.network_interface[0].access_config[0].nat_ip
    }
  )
  filename   = "ansible/hosts.cfg"
  depends_on = [google_compute_instance.k8s]
}
resource "null_resource" "hardening" {
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
    connection {
      type        = "ssh"
      user        = var.ssh_username
      private_key = file("/home/${var.ssh_username}/.ssh/id_rsa")
      host        = google_compute_instance.k8s.network_interface[0].access_config[0].nat_ip
    }
  }
  provisioner "local-exec" {
    command = "cd ansible; ansible-playbook playbook-hardening.yml"
  }
  depends_on = [local_file.hosts_cfg, local_file.ssh_cfg]
}
#####################################################
##################################################### KUBESPRAY
resource "null_resource" "clone_kubespray" {
  provisioner "local-exec" {
    command = "git clone https://github.com/kubernetes-sigs/kubespray.git; cd kubespray; git checkout release-2.20; cp -rfp inventory/sample inventory/mycluster"
  }
  depends_on = [null_resource.hardening]
}

resource "local_file" "inventory_tpl" {
  content = templatefile("${path.module}/tpl/kubespray/inventory.tpl",
    {
      web_public_ip = google_compute_instance.k8s.network_interface[0].access_config[0].nat_ip
    }
  )
  filename   = "kubespray/inventory/mycluster/inventory.ini"
  depends_on = [null_resource.clone_kubespray]
}

resource "local_file" "addons_tpl" {
  content = templatefile("${path.module}/tpl/kubespray/addons.tpl",
    {
      web_private_ip = google_compute_instance.k8s.network_interface[0].network_ip
    }
  )
  filename   = "kubespray/inventory/mycluster/group_vars/k8s_cluster/addons.yml"
  depends_on = [null_resource.clone_kubespray]
}

resource "local_file" "k8s-cluster_tpl" {
  content = templatefile("${path.module}/tpl/kubespray/k8s-cluster.tpl",
    {}
  )
  filename   = "kubespray/inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml"
  depends_on = [null_resource.clone_kubespray]
}
resource "null_resource" "kubespray" {
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
    connection {
      type        = "ssh"
      user        = var.ssh_username
      private_key = file("/home/${var.ssh_username}/.ssh/id_rsa")
      host        = google_compute_instance.k8s.network_interface[0].access_config[0].nat_ip
    }
  }
  provisioner "local-exec" {
    command = "docker run --rm -v $(pwd)/kubespray:/mnt/kubespray -v ~/.ssh:/pem quay.io/kubespray/kubespray:v2.20.0 sh -c 'date; cd /mnt/kubespray; ansible-playbook -i inventory/mycluster/inventory.ini --private-key /pem/id_rsa -e ansible_user=${var.ssh_username} -b cluster.yml;'"
  }
  depends_on = [local_file.inventory_tpl, local_file.addons_tpl, local_file.k8s-cluster_tpl]
}
#####################################################
##################################################### DEPLOY WORDPRESS
resource "local_file" "wp-config" {
  content = templatefile("${path.module}/tpl/wp-config/wp-config.tpl",
    {
      db_name = google_sql_database.database.name
      db_user = google_sql_user.user.name
      db_pass = google_sql_user.user.password
      db_host = google_sql_database_instance.instance.private_ip_address
    }
  )
  filename   = "ansible/roles/deploy/files/wp-config.php"
  depends_on = [null_resource.kubespray]
}

resource "local_file" "values" {
  content = templatefile("${path.module}/tpl/deploy/values.tpl",
    {
      host   = var.host
      config = "/home/${var.ssh_username}/wp-config.php"
    }
  )
  filename   = "ansible/roles/deploy/files/wordpress/values.yaml"
  depends_on = [null_resource.kubespray]
}

resource "null_resource" "deploy" {
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
    connection {
      type        = "ssh"
      user        = var.ssh_username
      private_key = file("/home/${var.ssh_username}/.ssh/id_rsa")
      host        = google_compute_instance.k8s.network_interface[0].access_config[0].nat_ip
    }
  }
  provisioner "local-exec" {
    command = "cd ansible; ansible-playbook playbook-deploy.yml"
  }
  depends_on = [local_file.wp-config, local_file.values]
}
