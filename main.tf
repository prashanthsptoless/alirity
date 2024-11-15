//Resource Group Deployment - Network RG
module "resource_group" {
  source   = "../resource_groups"
  for_each = toset(var.rg_name)
  env      = var.env
  postfix  = var.postfix
  rg_name  = each.key
  location = var.location
  tags     = var.tags
}

//Virtual Network Deployment
module "virtual_network" {
  source              = "../virtual_network"
  vnet_name           = var.vnet_name
  resource_group_name = module.resource_group.name
  vnet_location       = module.resource_group.location
  address_space       = var.address_space
  tags                = var.tags
}


module "route_table" {
  source              = "../route_tables"
  route_table_name    = var.route_table_name
  vnet_location       = module.virtual_network.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.virtual_network.subnet1_id
}

module "rt_route" {
  source                       = "../routes_for_route_table"
  route_name                   = var.route1_name
  route_table_name             = module.route_table_1.name
  resource_group_name          = module.resource_group.name
  route_address_prefix         = var.route1_address_prefix
  route_next_hop_in_ip_address = var.route1_next_hop_in_ip_address
}

module "rt_route_2" {
  source                       = "../routes_for_route_table"
  route_name                   = var.route2_name
  route_table_name             = module.route_table_1.name
  resource_group_name          = module.resource_group.name
  route_address_prefix         = var.route2_address_prefix
  route_next_hop_in_ip_address = var.route2_next_hop_in_ip_address
}

module "rt_route_3" {
  source                       = "../routes_for_route_table"
  route_name                   = var.route3_name
  route_table_name             = module.route_table_1.name
  resource_group_name          = module.resource_group.name
  route_address_prefix         = var.route3_address_prefix
  route_next_hop_in_ip_address = var.route3_next_hop_in_ip_address
}


module "storage_account" {
  source               = "../storage_account"
  storage_account_name = var.storage_account_name
  resource_group_name  = module.resource_group_qa.name
  location             = module.resource_group_qa.location
}

module "storage_account_container1" {
  source                         = "../storage_account_container"
  storage_account_container_name = var.storage_account_container_name01
  storage_account_name           = module.storage_account.name
}

module "storage_account_container2" {
  source                         = "../storage_account_container"
  storage_account_container_name = var.storage_account_container_name02
  storage_account_name           = module.storage_account.name
}

module "storage_account_container3" {
  source                         = "../storage_account_container"
  storage_account_container_name = var.storage_account_container_name03
  storage_account_name           = module.storage_account.name
}

module "log_analytics_workspace" {
  source                       = "../log_analytics_workspace"
  log_analytics_workspace_name = var.log_analytics_workspace_name
  resource_group_name          = module.resource_group_qa.name
  location                     = module.resource_group_qa.location
}

module "application_insights" {
  source              = "../application_insights"
  app_insights_name   = var.app_insights_name
  location            = module.resource_group_qa.location
  resource_group_name = module.resource_group_qa.name
  workspace_id        = module.log_analytics_workspace.id
}

module "app_service_plan" {
  source                               = "../app_service_plan"
  app_service_plan_app_name            = var.app_service_plan_app_name
  location                             = module.resource_group_qa.location
  resource_group_name                  = module.resource_group_qa.name
  app_service_plan_kind                = var.app_service_plan_kind
  app_service_plan_max_elastic_workers = var.app_service_plan_max_elastic_workers
}


