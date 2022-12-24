# EC2 Launch Configuration
resource "aws_launch_configuration" "ansible" {
  name_prefix     = "WebServer-"
  key_name        = aws_key_pair.generated_key.key_name
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.Ansible_security.id]
  lifecycle {
    create_before_destroy = true
  }
}
