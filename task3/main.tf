provider "aws" {
  region = "us-east-2"
}
# EC2 Instances
resource "aws_instance" "web" {
  ami                    = "ami-0283a57753b18025b"
  instance_type          = "t2.small"
  vpc_security_group_ids = [aws_security_group.Webserver_security.id]
  user_data              = file("user_data.sh")
  root_block_device {
    volume_size = "10"
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
