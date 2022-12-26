module "AWS_Grafana" {
  source = "./modules/AWS"
  # AWS Instance configurations --------------------------------------------------
  # instance_type = "t2.micro"
  # key_name      = "id_rsa"
  # public_key    = "~/.ssh/id_rsa.pub"
  # user_data     = "user_data/user_data.sh"
  # ami_owner     = "099720109477"
  # ami_images    = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
  #-------------------------------------------------------------------------------
}

module "Azure_Grafana" {
  source = "./modules/Azure"
  # Azure Instance configurations ------------------------------------------------
  # resource_group_name     = "Grafana"
  # resource_group_location = "West Europe"
  # size                    = "Standard_B1s"
  # user_data               = "user_data/user_data.sh"
  # public_key              = "~/.ssh/id_rsa.pub"
  # image_publisher         = "Canonical"
  # image_offer             = "0001-com-ubuntu-server-jammy"
  # image_sku               = "22_04-lts"
  # image_version           = "latest"
  #-------------------------------------------------------------------------------
}
