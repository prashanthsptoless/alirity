//Azure Event Hub Namespace
//**************************************************************************************
resource "azurerm_eventhub_namespace" "eventhub_namespace" {
  name                 = "${var.env}-${var.postfix}-${var.eventhub_namespace}"
  resource_group_name  = var.resource_group_name
  location             = var.location
  sku                  = var.namespace_sku
  capacity             = var.namespace_capacity
  auto_inflate_enabled = var.namespace_auto_inflate_enabled
  tags                 = var.tags

  identity {
    type = var.identity_type
  }

}
//**************************************************************************************

//Azure Event Hub
//**************************************************************************************
resource "azurerm_eventhub" "eventhub_deploy" {
  name                = "${var.env}-${var.postfix}-${var.eventhub_name}"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace.name
  resource_group_name = var.resource_group_name
  partition_count     = var.partition_count
  message_retention   = var.message_retention
}
//**************************************************************************************