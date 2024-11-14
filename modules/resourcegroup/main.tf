resource "azurerm_resource_group" "module_resource_group" {
  name          =  var.resource_group_prefix
  location      = var.location

  tags = {
    environment = var.environment
    owner       = var.owner
    project     = var.project
  }
}
