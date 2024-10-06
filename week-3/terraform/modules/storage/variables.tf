variable "resource_group_name" {
  type        = string
  nullable    = false
  description = "Name of the resource group within which to create the app service"
}

variable "location" {
  type        = string
  nullable    = false
  description = "Name of the location where to create the app service"
}

variable "container_name" {
  type        = string
  nullable    = false
  description = "Name of the storage container"
}

variable "storage_account_name" {
  type        = string
  nullable    = false
  description = "Name of the storage account"
}

variable "user_principal_id" {
  type        = string
  default     = null
  description = "Principal ID of the user to assign the blob storage reader role to"
}

variable "service_principal_id" {
  type        = string
  default     = null
  description = "Principal ID of the app service to assign the blob storage reader role to"
}
