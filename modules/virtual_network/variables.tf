//VNET Variables 
//********************************************************************************************
variable "env" {
  description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
}
variable "postfix" {
  description = "(Required) A unique identifier for the deployment. Part of the naming scheme."
}
variable "vnet_name" {
  description = "Name of the vnet to create"
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}
variable "location" {
  description = "Location to create the vnet"
  type        = string
}
variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
}
# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  type        = list(string)
  default     = []
}
variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(any)
  default     = {}
}

locals {
  timeout_duration = "2h"
}
//********************************************************************************************