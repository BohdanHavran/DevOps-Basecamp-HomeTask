# EC2 AMI
data "aws_ami" "ubuntu" {
  owners      = [var.ami_owner]
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_images]
  }
}
