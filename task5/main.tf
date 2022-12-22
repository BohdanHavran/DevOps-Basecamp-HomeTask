locals {
  key_name         = "devops"
  private_key_path = "~/Downloads/devops.pem"
}
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "devops"
  public_key = tls_private_key.example.public_key_openssh
}
provider "aws" {
  region = "us-east-2"
}
# EC2 AMI
data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
# EC2 Instances
resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.Webserver_security.id]
  # user_data              = file("user_data.sh")
  root_block_device {
    volume_size = "10"
  }
  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.example.private_key_pem
      host        = aws_instance.web.public_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ansible ansible/playbook.yml"
  }
}
# EC2 Security Group
resource "aws_security_group" "Webserver_security" {
  name = "Security Group1"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# EC2 Public-IP
output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}
output "ec2_ip" {
  value = aws_instance.web.public_ip
}
resource "local_file" "key_file" {
  content         = tls_private_key.example.private_key_pem
  filename        = "/home/bohdan/.ssh/devops.pem"
  file_permission = "0400"
  depends_on      = [tls_private_key.example]
}
resource "local_file" "ssh_cfg" {
  content = templatefile("${path.module}/ansible/group_vars/iaa.tpl",
    {
      ssh = "/home/bohdan/.ssh/devops.pem"
    }
  )
  filename = "ansible/group_vars/iaa"
}
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/ansible/hosts.tpl",
    {
      web_public_ip = aws_instance.web.public_ip
    }
  )
  filename = "ansible/hosts.cfg"
}
