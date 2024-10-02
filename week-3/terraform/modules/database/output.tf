output "server_address" {
  value = azurerm_postgresql_flexible_server.playground_computing.fqdn
  description = "Hostname to connect to the database server"
}

output "port" {
  value = 5432
  description = "Port of the database instance"
}
