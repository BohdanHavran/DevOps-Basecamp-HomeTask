# Azurerm network security group
resource "azurerm_network_security_group" "vm_nsg" {
  name                = "grafana-nsg"
  location            = azurerm_resource_group.DevTerraform.location
  resource_group_name = azurerm_resource_group.DevTerraform.name

  security_rule {
    name                       = "Allow_Grafana"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "20"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
