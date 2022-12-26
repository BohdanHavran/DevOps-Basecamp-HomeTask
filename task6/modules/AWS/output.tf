# EC2 Public-IP
output "ec2_ip" {
  value = aws_instance.Grafana.public_ip
}
