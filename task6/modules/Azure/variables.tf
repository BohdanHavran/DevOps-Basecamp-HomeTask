variable "resource_group_name" {
  description = "Resource group name"
  default     = "Grafana"
}
variable "resource_group_location" {
  description = "Resource group location"
  default     = "West Europe"
}
variable "size" {
  description = "Size instance"
  default     = "Standard_B1s"
}
variable "user_data" {
  description = "Source user_data"
  type        = string
  default     = "user_data/user_data.sh"
}
variable "public_key" {
  description = "Source public key"
  default     = "~/.ssh/id_rsa.pub"
}
variable "image_publisher" {
  description = "Image publisher"
  default     = "Canonical"
}
variable "image_offer" {
  description = "Image offer"
  default     = "0001-com-ubuntu-server-jammy"
}
variable "image_sku" {
  description = "Image sku"
  default     = "22_04-lts"
}
variable "image_version" {
  description = "Image version"
  default     = "latest"
}
