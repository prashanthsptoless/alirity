// Create the First Function App Resource
//**********************************************************************************************
variable "env" {
  description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
}
variable "postfix" {
  description = "(Required) A unique identifier for the deployment. Part of the naming scheme."
}
variable "function_app_name" {
  description = "(Required) The bespoke name of the app you are deploying."
}
variable "location" {
  description = "(Required) The cloud region where resources will be deployed into."
}
variable "resource_group_name" {
  description = "(Required) The resource group to deploy the function app into."
}
variable "function_app_asp_id" {
  description = "(Required) App Service Plan ID used by the function app."
}
variable "function_app_storage_account_name" {
  description = "(Required) storage_account_name used by the function app."
}
variable "function_app_storage_account_access_key" {
  description = "(Required) storage_account_name primary access key used by the function app."
}
variable "function_app_https_only" {
  description = "(Optional) Booolean to toggle if the function app can only be accessed via HTTPS."
  default     = true
}
variable "function_app_os_type" {
  type        = string
  description = "(Optional) The function app os type. Enter 'linux' for Linux and leave null for Windows"
  default     = ""
}
variable "function_app_version" {
  type        = string
  description = "(Optional) The runtime version associated with the Function App. Defaults to ~1"
  default     = "~1"
}
variable "function_app_client_cert_mode" {
  description = "(Optional) The mode of the Function App's client certificates requirement for incoming requests.  Possible values are Required and Optional."
  type        = string
  default     = "Optional"
}
variable "function_app_identity_type" {
  description = "Add an Identity (MSI) to the function app. Possible values are SystemAssigned or UserAssigned"
  type        = string
  default     = "SystemAssigned"
}
variable "function_app_settings" {
  description = "(Optional) Variables passed as environment variables"
  type        = map(any)
  default     = {}
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}
//**********************************************************************************************
