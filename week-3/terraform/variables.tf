variable "subscription_id" {
  type = string
  nullable = false
  description = <<EOT
Your Azure subscription ID

To retrieve it:
az login --use-device-code
az account show --query='id' --output=tsv
EOT
}

variable "email_address" {
  type = string
  nullable = false
  description = "Your JUNIA email address. Example: firstname.lastname@*.junia.com"
}

variable "server_hostname_prefix" {
  type = string
  nullable = false
  description = "Prefix used to compose the public hostname of the database server. Example: playground-computing-handlegithub"
}

variable "database_username" {
  type = string
  nullable = false
  description = "Administrator username for the database"
}

variable "database_password" {
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
