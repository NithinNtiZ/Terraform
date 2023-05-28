# Create a virtual network within the resource group
resource "azurerm_virtual_network" "test_VNET" {
  name                = var.vnet-name
  resource_group_name = azurerm_resource_group.test_RG.name
  location            = azurerm_resource_group.test_RG.location
  address_space       = ["10.0.0.0/16"]
}

# Create subnets

resource "azurerm_subnet" "pub" {
  name                 = "pub_subnet"
  resource_group_name  = azurerm_resource_group.test_RG.name
  virtual_network_name = azurerm_virtual_network.test_VNET.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "pvt" {
  name                 = "pvt_subnet"
  resource_group_name  = azurerm_resource_group.test_RG.name
  virtual_network_name = azurerm_virtual_network.test_VNET.name
  address_prefixes     = ["10.0.2.0/24"]
}
