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
}

module "examples_api_service" {
  source = "./modules/app_service"
  count  = var.enable_api? 1 : 0

  resource_group_name = local.resource_group
  location            = local.location

  app_name            = "examples-api-${var.github_handle}"
  pricing_plan        = "P0v3"
  docker_image        = "fhuitelec/examples-api:1.0.0"
  docker_registry_url = "https://ghcr.io"

  app_settings = {
    DATABASE_HOST     = local.database_connection.host
    DATABASE_PORT     = local.database_connection.port
    DATABASE_NAME     = local.database.name
    DATABASE_USER     = local.database.username
    DATABASE_PASSWORD = local.database.password
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