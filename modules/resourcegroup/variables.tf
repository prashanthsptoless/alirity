variable "resource_group_prefix" {
  description = "enter resource group short name"
  type = string
}

variable "location" {
  description = "location where azure resources will be deployed"
  type = string
  
  validation {
    condition = contains(["northeurope", "westeurope"], var.location)
    error_message = "the location must be either 'North Europe' or 'West Europe'"
  }
}

variable "environment" {
  description = "environment name"
  type        = string
}

variable "solution" {
  description = "enter project name "
  type = string
}

variable "owner" {
  type = string
}

variable project {
type        = string
}


