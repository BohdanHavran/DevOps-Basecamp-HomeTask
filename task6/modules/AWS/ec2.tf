# EC2 Instances
resource "aws_instance" "Grafana" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.Grafana_security.id]
  user_data              = file(var.user_data)
  key_name               = var.key_name
}
