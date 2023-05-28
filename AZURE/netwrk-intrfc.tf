#create a network interface


resource "azurerm_network_interface" "test_NIC" {
  name                = "test-nic"
  location            = azurerm_resource_group.test_RG.location
  resource_group_name = azurerm_resource_group.test_RG.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.pub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pub_IP.id

  }
}