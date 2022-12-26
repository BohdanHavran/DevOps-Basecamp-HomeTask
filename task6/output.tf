output "AWS_public_ip" {
  value = module.AWS_Grafana.ec2_ip
}
output "Azure_public_ip" {
  value = module.Azure_Grafana.public_ip
}
