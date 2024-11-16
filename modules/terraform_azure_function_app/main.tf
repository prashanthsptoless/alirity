// Create the Function App Resource
//**********************************************************************************************
resource "azurerm_function_app" "function_app" {
  name                       = "${var.env}-${var.postfix}-${var.function_app_name}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.function_app_asp_id
  storage_account_name       = var.function_app_storage_account_name
  storage_account_access_key = var.function_app_storage_account_access_key
  https_only                 = var.function_app_https_only
  os_type                    = var.function_app_os_type
  version                    = var.function_app_version
  client_cert_mode           = var.function_app_client_cert_mode

  identity {
    type = var.function_app_identity_type
  }
  app_settings = var.function_app_settings
  tags         = var.tags
}
//**********************************************************************************************
