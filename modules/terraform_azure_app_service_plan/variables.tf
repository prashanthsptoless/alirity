// Required Variables for First App Service Plan 
//**********************************************************************************************
variable "env" {
  description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
}
variable "postfix" {
  description = "(Required) A unique identifier for the deployment. Part of the naming scheme."
}
variable "app_service_plan_app_name" {
  description = "(Required) The bespoke name of the app service plan you are deploying."
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the namespace. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "app_service_plan_kind" {
  description = "(Optional) The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows. Changing this forces a new resource to be created."
  default     = "Windows"
}
variable "app_service_plan_max_elastic_workers" {
  description = "(Optional) The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan."
  type        = number
  default     = null
}
variable "app_service_plan_reserved" {
  description = "(Optional) Is this App Service Plan Reserved. This has to be false if the kind is Windows."
  type        = bool
  default     = false
}
variable "app_service_plan_per_site_scaling" {
  description = "(Optional) Can Apps assigned to this App Service Plan be scaled independently? If set to false apps assigned to this plan will scale to all instances of the plan."
  type        = bool
  default     = false
}
variable "app_service_plan_sku_tier" {
  description = "(Optional) Specifies the plan's pricing tier."
  default     = "PremiumV2"
}
variable "app_service_plan_sku_size" {
  description = "(Optional) Specifies the plan's instance size."
  default     = "P1v2"
}
variable "app_service_plan_sku_capacity" {
  description = "(Optional) Specifies the number of workers associated with this App Service Plan."
  default     = 1
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}
//**********************************************************************************************
