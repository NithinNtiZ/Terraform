#Create a nsg group


resource "azurerm_network_security_group" "test_nsg" {
  name                = "ssh_nsg"
  location            = azurerm_resource_group.test_RG.location
  resource_group_name = azurerm_resource_group.test_RG.name

  security_rule {
    name                       = "allow_ssh_sg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

#associate nsg with nic 

resource "azurerm_network_interface_security_group_association" "association" {
  network_interface_id      = azurerm_network_interface.test_NIC.id
  network_security_group_id = azurerm_network_security_group.test_nsg.id
}