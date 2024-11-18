//Common enviroment Variables 
//********************************************************************************************
env     = "dev"
postfix = "mpmt"

location = "northeurope"
tags = {
  "environment" = "dev"
  "project"     = "mpmt"
  "client_name" = "aligity"
  "business"    = "it"
}
//********************************************************************************************

//Resource Group Variables 
//********************************************************************************************
rg_name = ["nwt-hub-01", "network-01", "appserv-01", "servorchest-01", "datastorage-01", "core-infra-01"]


//Virtual Network Variables 
//********************************************************************************************
vnet_name_hub     = "vnet-hub"
address_space_hub = ["10.10.0.0/24"]

vnet_name_spoke     = "vnet-spoke"
address_space_spoke = ["10.20.0.0/24"]

//Subnet Variables 
//********************************************************************************************
//Hub subnets
subnet1_name              = "FirewallSubnet"
subnet1_prefixes          = ["10.10.0.0/26"]
subnet1_service_endpoints = ["Microsoft.Web"]

subnet2_name              = "BastionSubnet"
subnet2_prefixes          = ["10.10.0.64/26"]
subnet2_service_endpoints = []

subnet3_name              = "Gatewaysubnet"
subnet3_prefixes          = ["10.10.0.128/26"]
subnet3_service_endpoints = []

//Spoke Subnets
subnet_spoke_name_01              = "orchest-tier"
subnet_spoke_prefixes_01          = ["10.20.0.0/27"]
subnet_spoke_service_endpoints_01 = []

subnet_spoke_name_02              = "data-tier"
subnet_spoke_prefixes_02          = ["10.20.0.32/27"]
subnet_spoke_service_endpoints_02 = []

subnet_spoke_name_03              = "calc-tier"
subnet_spoke_prefixes_03          = ["10.20.0.64/27"]
subnet_spoke_service_endpoints_03 = []

subnet_spoke_name_04              = "private-endpoint"
subnet_spoke_prefixes_04          = ["10.20.0.96/27"]
subnet_spoke_service_endpoints_04 = []


// Virtual Network Peering
//**********************************************************************************************
hub_vnet_peering_name   = "peer-hub-to-spoke"
spoke_vnet_peering_name = "peer-spoke-to-hub"

//NSG Variables 
//********************************************************************************************
nsg_name = "nsg"

// Application Insights Variables
//**********************************************************************************************
app_insights_name            = "appins"
app_insights_name_fep_member = "aa" #need to pass the value

// Variables Private Dns Zone = 
//**********************************************************************************************
private_dns_zone_name           = ["ptzone"]
private_dns_zone_vnet_link_name = "ptlink"

//Azure Log analytics workspace Variables
//**************************************************************************************
log_analytics_workspace_name    = "log-analytics-workspace"
log_analytics_workspace_rg_name = "logna"

//Variables for Storage Account 01
//****************************************************************************
storage_account_name             = "datastor"
storage_account_container_name01 = "data-cont-01"
storage_account_container_name02 = "data-cont-02"
storage_account_container_name03 = "data-cont-03"


// Required Variables for First App Service Plan 
//**********************************************************************************************
app_service_plan_app_name            = "app-srvc-plan"
app_service_plan_kind                = "Linux"
app_service_plan_max_elastic_workers = "1" #need to pass the value

// Create the Function App Resource variables
//**********************************************************************************************
function_app_name = "fun-mpmt"
