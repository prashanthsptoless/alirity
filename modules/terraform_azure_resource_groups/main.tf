//Resource Group Deployment
//***************************************************************************
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.env}-${var.postfix}-${var.rg_name}"
  location = var.location
  tags     = var.tags
}
//***************************************************************************