#create a public ip

resource "azurerm_public_ip" "pub_IP" {
  name                = "pub_IP"
  resource_group_name = azurerm_resource_group.test_RG.name
  location            = azurerm_resource_group.test_RG.location
  allocation_method   = "Static"

  tags = {
    environment = "test"
  }
}
