variable "location" {
  type        = string
  default     = "francecentral"
  description = "Location of the resources"
}

variable "resource_group_name" {
  type        = string
  default     = "week-3"
  description = "Name of the resource group in which all resource are grouped"
}


############
# Identity #
############


variable "github_handle" {
  type        = string
  nullable    = false
  description = "Your GitHub username"
}

variable "subscription_id" {
  type        = string
  nullable    = false
  description = <<EOT
Your Azure subscription ID

To retrieve it:
az login --use-device-code
az account show --query='id' --output=tsv
EOT
}

variable "email_address" {
  type        = string
  nullable    = false
  description = "Your JUNIA email address. Example: firstname.lastname@*.junia.com"
}


############
# Database #
############


variable "database_server_name" {
  type        = string
  default     = null
  description = "Name of the database server. Example: playground-computing-handlegithub"
}

variable "database_name" {
  type        = string
  default     = null
  description = "Name for the database within the server"
}

variable "database_username" {
  type        = string
  default     = null
  description = "Administrator username for the database"
}

variable "database_password" {
  type        = string
  default     = null
  sensitive   = true
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

resource "random_password" "database_password" {
  length      = 24
  min_special = 1
  min_numeric = 2
  min_lower   = 2
  min_upper   = 2
}
