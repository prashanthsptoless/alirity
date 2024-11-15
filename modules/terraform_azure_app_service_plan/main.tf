// Create Azure App Service Plan
//**********************************************************************************************
resource "azurerm_app_service_plan" "app_service_plan" {
  name                         = "${var.env}-${var.postfix}-${var.app_service_plan_app_name}"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  kind                         = var.app_service_plan_kind
  maximum_elastic_worker_count = var.app_service_plan_max_elastic_workers
  reserved                     = var.app_service_plan_reserved
  per_site_scaling             = var.app_service_plan_per_site_scaling

  sku {
    tier     = var.app_service_plan_sku_tier
    size     = var.app_service_plan_sku_size
    capacity = var.app_service_plan_sku_capacity
  }
  tags = var.tags
}
//**********************************************************************************************
