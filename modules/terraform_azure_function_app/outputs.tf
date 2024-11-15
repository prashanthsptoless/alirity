//Outputs for Function App Resource
//****************************************************************************
output "id" {
  description = "The name of the newly Function App Resource"
  value       = azurerm_function_app.function_app.id
}
output "name" {
  description = "The name of the newly Function App Resource"
  value       = azurerm_function_app.function_app.name
}