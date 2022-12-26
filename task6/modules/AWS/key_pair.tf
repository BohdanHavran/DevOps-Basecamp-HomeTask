# EC2 Key pair
resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file(var.public_key)
}
