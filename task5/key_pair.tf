# EC2 Creating key pair
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "generated_key" {
  key_name   = "devops"
  public_key = tls_private_key.ssh.public_key_openssh
}
