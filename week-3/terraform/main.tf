data "azurerm_subscription" "current" {
}

data "azuread_user" "user" {
  user_principal_name = var.email_address
}

resource "azurerm_resource_group" "week_3" {
  name     = var.resource_group_name
  location = var.location
}

module "database" {
  source  = "./modules/database"

  resource_group_name = azurerm_resource_group.week_3.name
  location = azurerm_resource_group.week_3.location
  entra_administrator_tenant_id = data.azurerm_subscription.current.tenant_id
  entra_administrator_object_id = data.azuread_user.user.object_id
  entra_administrator_principal_type = "User"
  entra_administrator_principal_name = data.azuread_user.user.user_principal_name
  server_name = var.server_hostname_prefix
  database_administrator_login = var.database_username
  database_administrator_password = var.database_password
  database_name = var.database_name
}
