//Variables for Storage Account Container
//****************************************************************************
variable "env" {
  description = "(Required) The environment where resources will be deployed into. Part of the naming scheme."
}
variable "postfix" {
  description = "(Required) A unique identifier for the deployment. Part of the naming scheme."
}
variable "storage_account_container_name" {
  description = "(Required) The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created."
}
variable "storage_account_name" {
  description = "(Optional) A unique identifier for the storage account. Part of the naming scheme."
  type        = string
}
variable "storage_account_container_access_type" {
  description = "(Optional) The Access Level configured for this Container. Possible values are blob, container or private. Defaults to private."
  default     = "private"
}
//****************************************************************************