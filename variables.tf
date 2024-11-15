// Required Variables for Resource Group
//**********************************************************************************************
variable "env" {
  description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
  default     = "aik"
}
variable "postfix" {
  description = "(Required) A unique identifier for the deployment. Part of the naming scheme."
  default     = "network"
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
  default     = "eastus2"
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}
//**********************************************************************************************

//VNET Variables 
//********************************************************************************************
variable "rg_name" {
  description = "(Required) Specifies the Name of the RG. Changing this forces a new resource to be created."
  type        = string
}
//********************************************************************************************

//VNET Variables 
//********************************************************************************************
variable "vnet_name" {
  description = "Name of the vnet to create"
  type        = string
}
variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
}
variable "subnet1_name" {
  description = "A list of public subnets inside the vNet."
  type        = string
}
variable "subnet1_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "subnet1_service_endpoints" {
  description = "A map of subnet name to service endpoints to add to the subnet."
  type        = list(string)
  default     = []
}
variable "subnet2_name" {
  description = "A list of public subnets inside the vNet."
  type        = string
}
variable "subnet2_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
}
variable "subnet2_service_endpoints" {
  description = "A map of subnet name to service endpoints to add to the subnet."
  type        = list(string)
  default     = []
}
//********************************************************************************************

//Route Table 1 and routes for rt1 variables
//********************************************************************************************
variable "route_table_name" {
  description = "(Required) The name of the route table. Changing this forces a new resource to be created."
  type        = string
}
variable "route1_name" {
  description = "(Required) The name of the route. Changing this forces a new resource to be created."
  type        = string
}
variable "route1_address_prefix" {
  description = "(Required) The name of the route. Changing this forces a new resource to be created."
  type        = string
}
variable "route1_next_hop_in_ip_address" {
  description = "(Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
  type        = string
}
variable "route2_name" {
  description = "(Required) The name of the route. Changing this forces a new resource to be created."
  type        = string
}
variable "route2_address_prefix" {
  description = "(Required) The name of the route. Changing this forces a new resource to be created."
  type        = string
}
variable "route2_next_hop_in_ip_address" {
  description = "(Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
  type        = string
}
variable "route3_name" {
  description = "(Required) The name of the route. Changing this forces a new resource to be created."
  type        = string
}
variable "route3_address_prefix" {
  description = "(Required) The name of the route. Changing this forces a new resource to be created."
  type        = string
}
variable "route3_next_hop_in_ip_address" {
  description = "(Optional) Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance."
  type        = string
}
//**********************************************************************************************

//Route Table 2 and routes for rt2 variables
//********************************************************************************************
variable "route_table2_name" {
  description = "(Required) The name of the route table. Changing this forces a new resource to be created."
  type        = string
}
//**********************************************************************************************

//Variables for Storage Account 01
//****************************************************************************
variable "storage_account_name" {
  description = "(Optional) A unique identifier for the storage account. Part of the naming scheme."
  type        = string
}
variable "storage_account_container_name01" {
  description = "(Required) The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created."
}
variable "storage_account_container_name02" {
  description = "(Required) The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created."
}
variable "storage_account_container_name03" {
  description = "(Required) The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created."
}

//Azure Log analytics workspace Variables
//**************************************************************************************
variable "log_analytics_workspace_name" {
  type        = string
  description = "(Required) Specifies the name of the Log Analytics Workspace. Workspace name should include 4-63 letters, digits or '-'. The '-' shouldn't be the first or the last symbol. Changing this forces a new resource to be created."
}

// Application Insights Variables
//**********************************************************************************************
variable "app_insights_name" {
  description = "(Required) Specifies the name of the Application Insights component. Changing this forces a new resource to be created."
  type        = string
}

// Required Variables for First App Service Plan 
//**********************************************************************************************
variable "app_service_plan_app_name" {
  description = "(Required) The bespoke name of the app service plan you are deploying."
}
variable "app_service_plan_kind" {
  description = "(Optional) The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
}
variable "app_service_plan_max_elastic_workers" {
  description = "(Optional) The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan."
  type        = number
  default     = 2
}

// Create the Function App Resource variables
//**********************************************************************************************
variable "function_app_name" {
  description = "(Required) The bespoke name of the app you are deploying."
}
//**********************************************************************************************














