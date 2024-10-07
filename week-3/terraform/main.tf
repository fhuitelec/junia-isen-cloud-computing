data "azurerm_subscription" "current" {
}

data "azuread_user" "user" {
  user_principal_name = var.email_address
}

data "github_user" "user" {
  username = var.github_handle
}

resource "azurerm_resource_group" "week_3" {
  name     = var.resource_group_name
  location = var.location
}

locals {
  resource_group = azurerm_resource_group.week_3.name
  location       = azurerm_resource_group.week_3.location
  app_name       = "examples-api-${var.github_handle}"
}

module "examples_api_service" {
  source = "./modules/app_service"
  count  = var.enable_api ? 1 : 0

  resource_group_name = local.resource_group
  location            = local.location

  app_name            = local.app_name
  pricing_plan        = "P0v3"
  docker_image        = "fhuitelec/examples-api:2.1.0"
  docker_registry_url = "https://ghcr.io"

  app_settings = {
    DATABASE_HOST     = local.database_connection.host
    DATABASE_PORT     = local.database_connection.port
    DATABASE_NAME     = local.database.name
    DATABASE_USER     = local.database.username
    DATABASE_PASSWORD = local.database.password

    STORAGE_ACCOUNT_URL = local.storage_url

    NEW_RELIC_LICENSE_KEY = var.new_relic_licence_key
    NEW_RELIC_APP_NAME    = local.app_name
  }
}

module "database" {
  source = "./modules/database"
  count  = var.enable_database ? 1 : 0

  resource_group_name = local.resource_group
  location            = local.location

  entra_administrator_tenant_id      = data.azurerm_subscription.current.tenant_id
  entra_administrator_object_id      = data.azuread_user.user.object_id
  entra_administrator_principal_type = "User"
  entra_administrator_principal_name = data.azuread_user.user.user_principal_name

  server_name                     = local.database.server_name
  database_administrator_login    = local.database.username
  database_administrator_password = local.database.password
  database_name                   = local.database.name
}

locals {
  database_connection = {
    host = try(module.database[0].server_address, null)
    port = try(module.database[0].port, null)
  }
}

module "api_storage" {
  source = "./modules/storage"
  count  = var.enable_storage ? 1 : 0

  resource_group_name  = local.resource_group
  location             = local.location
  storage_account_name = local.storage.name
  container_name       = "api"

  service_principal_id = var.enable_storage_read_for_api ? module.examples_api_service[0].principal_id : null
  user_principal_id    = var.enable_storage_read_for_user ? data.azuread_user.user.object_id : null
}

locals {
  storage_url = try(module.api_storage[0].url, null)
}
