output "server_address" {
  value = azurerm_postgresql_flexible_server.playground_computing.fqdn
  description = "Hostname to connect to the database"
}

output "port" {
  value = 5432
  description = "Port to connect to the database"
}

output "username" {
  value = azurerm_postgresql_flexible_server.playground_computing.administrator_login
  description = "Username to connect to the database"
}

output "password" {
  value = azurerm_postgresql_flexible_server.playground_computing.administrator_password
  description = "Password to connect to the database"
  sensitive = true
}

output "database" {
  value = azurerm_postgresql_flexible_server_database.database.name
  description = "Database name to connect to"
}

output "ssl" {
  value = "enabled"
  description = "Whether SSL is enabled or not on the server"
}
