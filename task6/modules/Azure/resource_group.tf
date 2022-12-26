# Azurerm resource group
resource "azurerm_resource_group" "DevTerraform" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
