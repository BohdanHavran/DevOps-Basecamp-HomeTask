# EC2 Autoscaling Group
resource "aws_autoscaling_group" "ansible" {
  name                 = "AS-${aws_launch_configuration.ansible.name}"
  launch_configuration = aws_launch_configuration.ansible.name
  min_size             = 3
  max_size             = 3
  vpc_zone_identifier  = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id, aws_default_subnet.default_az3.id]
  lifecycle {
    create_before_destroy = true
  }
}
data "aws_instances" "ansible_instances" {
  instance_state_names = ["running"]
  depends_on           = [aws_autoscaling_group.ansible]
}
