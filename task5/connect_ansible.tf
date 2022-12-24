# Connect Ansible
resource "null_resource" "ansible" {
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.example.private_key_pem
      host        = data.aws_instances.web_instances.public_ips[0]
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook ansible/playbook.yml"
  }
}
