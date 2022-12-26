variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}
variable "key_name" {
  description = "Key name"
  default     = "id_rsa"
}
variable "public_key" {
  description = "Source public key"
  default     = "~/.ssh/id_rsa.pub"
}
variable "user_data" {
  description = "Source user_data"
  default     = "user_data/user_data.sh"
}
variable "ami_owner" {
  description = "Ami owner"
  default     = "099720109477"
}
variable "ami_images" {
  description = "Ami images"
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}
