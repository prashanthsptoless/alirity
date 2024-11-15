// Application Insights Variables
//**********************************************************************************************
variable "env" {
  description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
}
variable "postfix" {
  description = "(Required) A unique identifier for the deployment. Part of the naming scheme."
}
variable "app_insights_name" {
  description = "(Required) Specifies the name of the Application Insights component. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "(Required) The cloud region where resources will be deployed into."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Application Insights component."
  type        = string
}
variable "application_type" {
  description = " (Required) Specifies the type of Application Insights to create."
  type        = string
  default     = "web"
}
variable "workspace_id" {
  description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
  type        = string
}
//**********************************************************************************************