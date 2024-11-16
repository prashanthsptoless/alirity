//Azure Event Hub Namespace Variables
//**************************************************************************************
variable "env" {
  description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
}
variable "postfix" {
  description = "(Required) A unique identifier for the deployment. Part of the naming scheme."
}
variable "eventhub_namespace" {
  description = "(Required) Specifies the name of the EventHub Namespace resource. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the namespace. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "namespace_sku" {
  description = "(Required) Defines which tier to use. Valid options are Basic, Standard, and Premium. Please note that setting this field to Premium will force the creation of a new resource."
  type        = string
  default     = "Basic"
}
variable "namespace_capacity" {
  description = "(Optional) Specifies the Capacity / Throughput Units for a Standard SKU namespace. Default capacity has a maximum of 2, but can be increased in blocks of 2 on a committed purchase basis. Defaults to 1."
  type        = string
  default     = "1"
}
variable "namespace_auto_inflate_enabled" {
  description = "(Optional) Is Auto Inflate enabled for the EventHub Namespace?"
  type        = bool
  default     = false
}
variable "identity_type" {
  description = "(Optional) An identity block as defined below."
  type        = string
  default     = "SystemAssigned"
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to all resources."
  type        = map(any)
  default     = {}
}

//Azure Event Hub Variables
variable "eventhub_name" {
  description = "(Required) Specifies the name of the EventHub resource. Changing this forces a new resource to be created."
}
variable "partition_count" {
  description = "val(Required) Specifies the current number of shards on the Event Hub. Changing this will force-recreate the resource.ue"
  type        = number
  default     = 2
}
variable "message_retention" {
  description = "(Required) Specifies the number of days to retain the events for this Event Hub. For Basic SKU default value will be 1"
  type        = number
  default     = 1
}
//**************************************************************************************







