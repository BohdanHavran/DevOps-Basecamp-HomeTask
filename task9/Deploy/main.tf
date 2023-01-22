module "AWS_Grafana" {
  source = "github.com/BohdanHavran/DevOps-Basecamp-HomeTask/task6/modules/AWS"
  # AWS Instance configurations --------------------------------------------------
  # instance_type = "t2.micro"
  # key_name      = "id_rsa"
  # public_key    = "~/.ssh/id_rsa.pub"
  user_data = "../user_data.sh"
  # ami_owner     = "099720109477"
  # ami_images    = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
  #-------------------------------------------------------------------------------
}
