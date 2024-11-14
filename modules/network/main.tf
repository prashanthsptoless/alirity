resource azurerm_virtual_network module_virtual_network {
    resource_group_name      = var.resource_group_name
    location                 = var.location
    name                     = var.vnet_name
    address_space            = var.address_space

    tags = {
    environment = var.environment
    owner       = var.owner
    project     = var.project
  }
}

resource "azurerm_subnet" "name" {
    name                 = "example-subnet"
    resource_group_name  = azurerm_resource_group.example.name
    virtual_network_name = azurerm_virtual_network.example.name
    address_prefixes     = ["10.0.1.0/24"]
}