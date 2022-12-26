# Azurerm subnet
resource "azurerm_subnet" "SubnetA" {
  name                 = "SubnetA"
  resource_group_name  = azurerm_resource_group.DevTerraform.name
  virtual_network_name = azurerm_virtual_network.VM_network.name
  address_prefixes     = ["10.0.2.0/24"]
}
