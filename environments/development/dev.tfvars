//Common enviroment Variables 
//********************************************************************************************
env = ""
postfix  = ""

location = ""
tags = {
  "environment" = ""
  "project"     = ""
  "client_name" = ""
  "business"    = ""
}
//********************************************************************************************

//Resource Group Variables 
//********************************************************************************************
rg_name  = []


//Virtual Network Variables 
//********************************************************************************************
vnet_name_hub     = ""
address_space_hub = ["10.0.0.0/0"]
vnet_name_spoke   = ""
address_space_spoke = ["10.0.0.0/0"]
//Subnet Variables 
//********************************************************************************************
subnet_name              = ""
subnet_prefixes          = ["10.0.0.0/24"]
subnet_service_endpoints = ["Microsoft.Web"]

//NSG Variables 
//********************************************************************************************
nsg_name = ""

// Application Insights Variables
//**********************************************************************************************
app_insights_name            = ""
app_insights_name_fep_member = ""

// Variables Private Dns Zone = 
//**********************************************************************************************
private_dns_zone_name           = [""]
private_dns_zone_vnet_link_name = ""

//Azure Log analytics workspace Variables
//**************************************************************************************
log_analytics_workspace_name    = ""
log_analytics_workspace_rg_name = ""

//Variables for Storage Account 01
//****************************************************************************
storage_account_name             = ""
storage_account_container_name01 = ""
storage_account_container_name02 = ""
storage_account_container_name03 = ""


// Required Variables for First App Service Plan 
//**********************************************************************************************
app_service_plan_app_name            = ""
app_service_plan_kind                = ""
app_service_plan_max_elastic_workers = ""

// Create the Function App Resource variables
//**********************************************************************************************
function_app_name = ""
