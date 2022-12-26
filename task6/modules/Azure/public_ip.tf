# Azurerm public ip
resource "azurerm_public_ip" "public_ip" {
  name                = "Grafana_ip"
  location            = azurerm_resource_group.DevTerraform.location
  resource_group_name = azurerm_resource_group.DevTerraform.name
  allocation_method   = "Static"
}
