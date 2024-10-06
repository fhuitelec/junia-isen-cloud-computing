output "url" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
  description = "Hostname to connect to the storage account"
}