# EC2 Availability Zones and Subnet
data "aws_availability_zones" "available" {}

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_default_subnet" "default_az2" {
  availability_zone = data.aws_availability_zones.available.names[1]
}

resource "aws_default_subnet" "default_az3" {
  availability_zone = data.aws_availability_zones.available.names[2]
}
