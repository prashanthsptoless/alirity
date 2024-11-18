//Outputs for Vnet and Subnets
//****************************************************************************
output "id" {
  description = "The id of the newly created vNet"
  value       = azurerm_subnet.vnet_subnet.id
}
output "name" {
  description = "The id of the newly created vNet"
  value       = azurerm_subnet.vnet_subnet.name
}
output "address_prefixes" {
  description = "The id of the newly created vNet"
  value       = azurerm_subnet.vnet_subnet.address_prefixes
}
//****************************************************************************