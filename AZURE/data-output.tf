/* 
data "azurerm_virtual_machine" "testVM" {
  name                = "testVM"
  resource_group_name = var.rg-name
}

output "virtual_machine_ip" {
  value = data.azurerm_virtual_machine.testVM.public_ip_address
} */