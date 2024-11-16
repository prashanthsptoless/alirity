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
output "subnet1_id" {
  description = "The id of the newly created subnet1"
  value       = azurerm_subnet.vnet_subnet1.id
  sensitive   = false
}
output "subnet2_id" {
  description = "The id of the newly created subnet2"
  value       = azurerm_subnet.vnet_subnet2.id
  sensitive   = false
}
//****************************************************************************