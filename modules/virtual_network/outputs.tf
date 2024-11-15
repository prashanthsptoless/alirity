//Outputs for Vnet and Subnets
//****************************************************************************
output "id" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.virtual_network.id
}
output "name" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.virtual_network.name
}
output "location" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.virtual_network.location
}
//****************************************************************************