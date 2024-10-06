output "url" {
  value = "https://${azurerm_linux_web_app.app_service.default_hostname}/"
  description = "Hostname to connect to the app service"
}

output "principal_id" {
  value = azurerm_linux_web_app.app_service.identity[0].principal_id
  description = "Principal ID of the API App service's managed identity"
}
