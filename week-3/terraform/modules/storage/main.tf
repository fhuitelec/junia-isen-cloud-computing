resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

resource "azurerm_role_assignment" "service_binding" {
  count = var.service_principal_id != null ? 1 : 0

  scope                = resource.azurerm_storage_container.container.resource_manager_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = var.service_principal_id
}

resource "azurerm_role_assignment" "user_binding" {
  count = var.user_principal_id != null ? 1 : 0

  scope                = resource.azurerm_storage_container.container.resource_manager_id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = var.user_principal_id
}
