# Azurerm virtual network
resource "azurerm_virtual_network" "VM_network" {
  name                = "VM_network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.DevTerraform.location
  resource_group_name = azurerm_resource_group.DevTerraform.name
}
