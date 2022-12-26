# Azurerm network interface
resource "azurerm_network_interface" "VM-interface" {
  name                = "VM-interface"
  location            = azurerm_resource_group.DevTerraform.location
  resource_group_name = azurerm_resource_group.DevTerraform.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.SubnetA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}
