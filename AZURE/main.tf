

# Create a resource group
resource "azurerm_resource_group" "test_RG" {
  name     = var.rg-name
  location = var.region
}

### create a virtual machine

resource "azurerm_virtual_machine" "testVM" {
  name                  = "testVM"
  location              = azurerm_resource_group.test_RG.location
  resource_group_name   = azurerm_resource_group.test_RG.name
  network_interface_ids = [azurerm_network_interface.test_NIC.id]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "GAME"
    admin_username = var.username
    admin_password = var.password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "test"
  }
}
