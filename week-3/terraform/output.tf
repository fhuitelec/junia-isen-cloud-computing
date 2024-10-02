output "server_address" {
  value = module.database.server_address
  description = "Hostname to connect to the database"
}

output "port" {
  value = module.database.port
  description = "Port to connect to the database"
}

output "username" {
  value = var.database_username
  description = "Username to connect to the database"
}

output "password" {
  value = var.database_password
  description = "Password to connect to the database"
  sensitive = true
}

output "database" {
  value = var.database_name
  description = "Database name to connect to"
}

output "ssl" {
  value = "enabled"
  description = "Whether SSL is enabled or not on the server"
}
