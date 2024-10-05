output "database" {
  value = length(module.database) == 0 ? null : {
    server_address = module.database[0].server_address
    port = module.database[0].port
    username = var.database_username
    password = var.database_password
    database = var.database_name
    ssl = "enabled"
  }
  sensitive = true
  description = "Database connection information"
}
