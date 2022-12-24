# Connect Ansible
resource "null_resource" "ansible" {
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.ssh.private_key_pem
      hosts       = [data.aws_instances.ansible_instances.public_ips[0], data.aws_instances.ansible_instances.public_ips[1]]
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook ansible/playbook.yml"
  }
}
