// Required Variables for Resource Group
//**********************************************************************************************
variable "env" {
  description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
}
variable "postfix" {
  description = "(Required) A unique identifier for the deployment. Part of the naming scheme."
}
variable "rg_name" {
  description = "(Required) Specifies the Name of the RG. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}
//**********************************************************************************************