//Resource Group Deployment - Network RG
module "resource_group" {
  source   = "./modules/terraform_azure_resource_groups"
  for_each = toset(var.rg_name) #([ "mpmt-nwt-hub-rg-01", "mpmt-network-rg-01", "mpmt-appserv-rg-01", "mpmt-servorchest-rg-01", "mpmt-datastg-rg-01" ])  #
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
  resource_group_name = module.resource_group["nwt-hub-01"].name
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
  resource_group_name = module.resource_group["network-01"].name
  address_space       = var.address_space_spoke
  tags                = var.tags
}

//hub Subnet1 Deployment
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

//hub Subnet1 Deployment
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

//hub Subnet3 Deployment
module "subnet_hub_03" {
  source                   = "./modules/terraform_azure_subnets"
  env                      = var.env
  postfix                  = var.postfix
  subnet_name              = var.subnet3_name
  resource_group_name      = module.virtual_network_hub.resource_group_name
  virtual_network_name     = module.virtual_network_hub.name
  subnet_prefixes          = var.subnet3_prefixes
  subnet_service_endpoints = var.subnet3_service_endpoints
}

//spoke Subnets Deployment
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

module "subnet_spoke_02" {
  source                   = "./modules/terraform_azure_subnets"
  env                      = var.env
  postfix                  = var.postfix
  subnet_name              = var.subnet_spoke_name_02
  resource_group_name      = module.virtual_network_spoke.resource_group_name
  virtual_network_name     = module.virtual_network_spoke.name
  subnet_prefixes          = var.subnet_spoke_prefixes_02
  subnet_service_endpoints = var.subnet_spoke_service_endpoints_02
}

module "subnet_spoke_03" {
  source                   = "./modules/terraform_azure_subnets"
  env                      = var.env
  postfix                  = var.postfix
  subnet_name              = var.subnet_spoke_name_03
  resource_group_name      = module.virtual_network_spoke.resource_group_name
  virtual_network_name     = module.virtual_network_spoke.name
  subnet_prefixes          = var.subnet_spoke_prefixes_03
  subnet_service_endpoints = var.subnet_spoke_service_endpoints_03
}

module "subnet_spoke_04" {
  source                   = "./modules/terraform_azure_subnets"
  env                      = var.env
  postfix                  = var.postfix
  subnet_name              = var.subnet_spoke_name_04
  resource_group_name      = module.virtual_network_spoke.resource_group_name
  virtual_network_name     = module.virtual_network_spoke.name
  subnet_prefixes          = var.subnet_spoke_prefixes_04
  subnet_service_endpoints = var.subnet_spoke_service_endpoints_04
}

module "vnet-peer-hub-to-spoke" {
  source                    = "./modules/virtual_network_peering"
  env                       = var.env
  postfix                   = var.postfix
  vnet_peering_name         = var.hub_vnet_peering_name
  resource_group_name       = module.virtual_network_hub.resource_group_name
  virtual_network_name      = module.virtual_network_hub.resource_group_name
  remote_virtual_network_id = module.virtual_network_spoke.id
}

module "vnet-peer-spoke-to-hub" {
  source                    = "./modules/virtual_network_peering"
  env                       = var.env
  postfix                   = var.postfix
  vnet_peering_name         = var.spoke_vnet_peering_name
  resource_group_name       = module.virtual_network_spoke.resource_group_name
  virtual_network_name      = module.virtual_network_spoke.resource_group_name
  remote_virtual_network_id = module.virtual_network_hub.id
}

module "log_analytics_workspace" {
  source                       = "./modules/terraform_azure_log_analytics_workspace"
  env                          = var.env
  postfix                      = var.postfix
  location                     = var.location
  log_analytics_workspace_name = var.log_analytics_workspace_name
  resource_group_name          = module.resource_group["core-infra-01"].name
}

module "application_insights" {
  source              = "./modules/terraform_azure_application_insights"
  env                 = var.env
  postfix             = var.postfix
  app_insights_name   = var.app_insights_name
  location            = var.location
  resource_group_name = module.resource_group["core-infra-01"].name
  workspace_id        = module.log_analytics_workspace.id
}


module "storage_account" {
  source               = "./modules/terraform_azure_storage_account"
  env                  = var.env
  postfix              = var.postfix
  location             = var.location
  storage_account_name = var.storage_account_name
  resource_group_name  = module.resource_group["datastorage-01"].name
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


module "app_service_plan" {
  source                    = "./modules/terraform_azure_app_service_plan"
  env                       = var.env
  postfix                   = var.postfix
  app_service_plan_app_name = var.app_service_plan_app_name
  location                  = module.resource_group["appserv-01"].location
  resource_group_name       = module.resource_group["appserv-01"].name
  app_service_plan_kind     = var.app_service_plan_kind
}


