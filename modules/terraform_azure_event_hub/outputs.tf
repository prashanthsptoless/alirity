//Outputs for Event Hub Namespace & Event Hub
//****************************************************************************
output "id" {
  description = "The name of the newly Event Hub Namespace"
  value       = azurerm_eventhub_namespace.eventhub_namespace.id
}
output "name" {
  description = "The name of the newly Event Hub Namespace"
  value       = azurerm_eventhub_namespace.eventhub_namespace.name
}

output "eventhub_id" {
  description = "The name of the newly Event Hub Namespace"
  value       = azurerm_eventhub.eventhub_deploy.id
}
output "eventhub_name" {
  description = "The name of the newly Event Hub Namespace"
  value       = azurerm_eventhub.eventhub_deploy.name
}