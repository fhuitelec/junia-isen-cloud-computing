variable "resource_group_name" {
  type = string
  description = "Name of the resource group within which to create the database server"
}

variable "location" {
  type = string
  description = "Name of the location where to create the database server"
}

variable "entra_administrator_tenant_id" {
  type = string
  nullable = false
  description = "ID of the tenant in which the Microsoft Entra entity is located"
}

variable "entra_administrator_object_id" {
  type = string
  nullable = false
  description = "Object ID of the Microsoft Entra entity that will be used as a database administrator"
}

variable "entra_administrator_principal_type" {
  type = string
  nullable = false
  description = "Microsoft Entra entity type"
}

variable "entra_administrator_principal_name" {
  type = string
  nullable = false
  description = "Microsoft Entra entity name"
}

variable "server_name" {
  type = string
  description = "Name of the database server. Will be used to compose the public hostname of the server"
}

variable "database_administrator_login" {
  type = string
  nullable = false
  description = "Administrator login for the database"
}

variable "database_administrator_password" {
  type = string
  sensitive = true
  nullable = false
  description = <<EOT
"Administrator password for the database"

The password must be at least 8 characters and at most 128 characters.
The password must contain characters from three of the following categories:
– English uppercase letters
- English lowercase letters
- numbers (0-9)
- non-alphanumeric characters (!, $, #, %, etc.)
EOT
}

variable "database_name" {
  type = string
  nullable = false
  description = "Name for the database within the server"
}
