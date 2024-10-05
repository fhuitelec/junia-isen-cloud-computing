output "url" {
  value = "https://${azurerm_linux_web_app.app_service.default_hostname}/"
  description = "Hostname to connect to the app service"
}