provider "aws" {
  # Please write your credentials ----------
  access_key = "Your access_key"
  secret_key = "Your secret_key"
  region     = "us-east-2"
  #-----------------------------------------
}
provider "azurerm" {
  features {}
  # Please write your credentials ----------
  subscription_id = "Your subscription_id"
  client_id       = "Your client_id"
  client_secret   = "Your client_secret"
  tenant_id       = "Your tenant_id"
  #-----------------------------------------
}
