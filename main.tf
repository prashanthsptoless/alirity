//Resource Group Deployment - Network RG
module "resource_group" {
  source   = "./modules/terraform_azure_resource_groups"
  for_each = toset(var.rg_name)
  env      = var.env
  postfix  = var.postfix
  rg_name  = each.key
  location = var.location
  tags     = var.tags
}

//HUB Virtual Network Deployment
module "virtual_network_hub" {
  source              = "./modules/virtual_network"
  env                 = var.env
  postfix             = var.postfix
  location            = var.location
  vnet_name           = var.vnet_name_hub
  resource_group_name = module.resource_group.name
  address_space       = var.address_space_hub
  tags                = var.tags
}

//Spoke Virtual Network Deployment
module "virtual_network_spoke" {
  source              = "./modules/virtual_network"
  env                 = var.env
  postfix             = var.postfix
  location            = var.location
  vnet_name           = var.vnet_name_spoke
  resource_group_name = module.resource_group.name
  address_space       = var.address_space_spoke
  tags                = var.tags
}

//Subnet Deployment
module "subnet_hub_01" {
  source                   = "./modules/terraform_azure_subnets"
  env                      = var.env
  postfix                  = var.postfix
  subnet_name              = var.subnet1_name
  resource_group_name      = module.virtual_network_hub.resource_group_name
  virtual_network_name     = module.virtual_network_hub.name
  subnet_prefixes          = var.subnet1_prefixes
  subnet_service_endpoints = var.subnet1_service_endpoints
}

//Subnet Deployment
module "subnet_hub_02" {
  source                   = "./modules/terraform_azure_subnets"
  env                      = var.env
  postfix                  = var.postfix
  subnet_name              = var.subnet2_name
  resource_group_name      = module.virtual_network_hub.resource_group_name
  virtual_network_name     = module.virtual_network_hub.name
  subnet_prefixes          = var.subnet2_prefixes
  subnet_service_endpoints = var.subnet2_service_endpoints
}


//Subnet Deployment
module "subnet_spoke_01" {
  source                   = "./modules/terraform_azure_subnets"
  env                      = var.env
  postfix                  = var.postfix
  subnet_name              = var.subnet_spoke_name_01
  resource_group_name      = module.virtual_network_spoke.resource_group_name
  virtual_network_name     = module.virtual_network_spoke.name
  subnet_prefixes          = var.subnet_spoke_prefixes_01
  subnet_service_endpoints = var.subnet_spoke_service_endpoints_01
}


module "route_table" {
  source              = "./modules/terraform_azure_route_tables"
  env                 = var.env
  postfix             = var.postfix
  location            = var.location
  route_table_name    = var.route_table_name
  resource_group_name = module.resource_group.name
  subnet_id           = module.virtual_network.subnet1_id
}

module "rt_route" {
  source                       = "./modules/terraform_azure_routes_for_route_table"
  env                          = var.env
  postfix                      = var.postfix
  route_name                   = var.route1_name
  route_table_name             = module.route_table_1.name
  resource_group_name          = module.resource_group.name
  route_address_prefix         = var.route1_address_prefix
  route_next_hop_in_ip_address = var.route1_next_hop_in_ip_address
}

module "rt_route_2" {
  source                       = "./modules/terraform_azure_routes_for_route_table"
  env                          = var.env
  postfix                      = var.postfix
  route_name                   = var.route2_name
  route_table_name             = module.route_table_1.name
  resource_group_name          = module.resource_group.name
  route_address_prefix         = var.route2_address_prefix
  route_next_hop_in_ip_address = var.route2_next_hop_in_ip_address
}

module "rt_route_3" {
  source                       = "./modules/terraform_azure_routes_for_route_table"
  env                          = var.env
  postfix                      = var.postfix
  route_name                   = var.route3_name
  route_table_name             = module.route_table_1.name
  resource_group_name          = module.resource_group.name
  route_address_prefix         = var.route3_address_prefix
  route_next_hop_in_ip_address = var.route3_next_hop_in_ip_address
}


module "storage_account" {
  source               = "./modules/terraform_azure_storage_account"
  env                  = var.env
  postfix              = var.postfix
  location             = var.location
  storage_account_name = var.storage_account_name
  resource_group_name  = module.resource_group_qa.name
}

module "storage_account_container1" {
  source                         = "./modules/terraform_azure_storage_account_container"
  storage_account_container_name = var.storage_account_container_name01
  storage_account_name           = module.storage_account.name
}

module "storage_account_container2" {
  source                         = "./modules/terraform_azure_storage_account_container"
  storage_account_container_name = var.storage_account_container_name02
  storage_account_name           = module.storage_account.name
}

module "storage_account_container3" {
  source                         = "./modules/terraform_azure_storage_account_container"
  storage_account_container_name = var.storage_account_container_name03
  storage_account_name           = module.storage_account.name
}

module "log_analytics_workspace" {
  source                       = "./modules/terraform_azure_log_analytics_workspace"
  env                          = var.env
  postfix                      = var.postfix
  location                     = var.location
  log_analytics_workspace_name = var.log_analytics_workspace_name
  resource_group_name          = module.resource_group_qa.name
}

module "application_insights" {
  source              = "./modules/terraform_azure_application_insights"
  env                 = var.env
  postfix             = var.postfix
  app_insights_name   = var.app_insights_name
  location            = module.resource_group_qa.location
  resource_group_name = module.resource_group_qa.name
  workspace_id        = module.log_analytics_workspace.id
}

module "app_service_plan" {
  source                               = "./modules/terraform_azure_app_service_plan"
  env                                  = var.env
  postfix                              = var.postfix
  app_service_plan_app_name            = var.app_service_plan_app_name
  location                             = module.resource_group_qa.location
  resource_group_name                  = module.resource_group_qa.name
  app_service_plan_kind                = var.app_service_plan_kind
  app_service_plan_max_elastic_workers = var.app_service_plan_max_elastic_workers
}


