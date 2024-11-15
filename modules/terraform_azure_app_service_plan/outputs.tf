//Outputs for App Service Plan
//****************************************************************************
output "id" {
  description = "The name of the newly App Service Plan"
  value       = azurerm_app_service_plan.app_service_plan.id
}
output "name" {
  description = "The name of the newly App Service Plan"
  value       = azurerm_app_service_plan.app_service_plan.name
}