# Save ssh key and configuration ansible
resource "local_file" "key_file" {
  content         = tls_private_key.example.private_key_pem
  filename        = "/home/${var.ssh_username}/.ssh/devops.pem"
  file_permission = "0400"
  depends_on      = [tls_private_key.example]
}
resource "local_file" "ssh_cfg" {
  content = templatefile("${path.module}/tpl/iaa.tpl",
    {
      ssh = "/home/${var.ssh_username}/.ssh/devops.pem"
    }
  )
  filename = "ansible/group_vars/iaa"
}
resource "local_file" "ssh2_cfg" {
  content = templatefile("${path.module}/tpl/iaa.tpl",
    {
      ssh = "/home/${var.ssh_username}/.ssh/devops.pem"
    }
  )
  filename = "ansible/group_vars/iaa2"
}
resource "local_file" "ssh3_cfg" {
  content = templatefile("${path.module}/tpl/iaa.tpl",
    {
      ssh = "/home/${var.ssh_username}/.ssh/devops.pem"
    }
  )
  filename = "ansible/group_vars/iaa3"
}
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/tpl/hosts.tpl",
    {
      web_public_ip   = data.aws_instances.web_instances.public_ips[0]
      web_public_ip_1 = data.aws_instances.web_instances.public_ips[1]
      web_public_ip_2 = data.aws_instances.web_instances.public_ips[2]
    }
  )
  filename = "ansible/hosts.cfg"
}
