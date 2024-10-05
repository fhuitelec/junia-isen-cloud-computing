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

  database_server_name = var.database_server_name != null ? var.database_server_name : "playground-computing-${var.github_handle}"
  database_name        = var.database_name != null ? var.database_name : var.github_handle
  database_username    = var.database_username != null ? var.database_username : var.github_handle
  database_password    = var.database_password != null ? var.database_password : random_password.database_password.result

  database = {
    host     = try(module.database[0].server_address, null)
    port     = try(module.database[0].port, null)
    name     = var.database_name
    user     = var.database_username
    password = local.database_password
  }
}

module "examples_api_service" {
  source = "./modules/app_service"
  count  = 0

  resource_group_name = local.resource_group
  location            = local.location

  app_name            = "examples-api-5dfa"
  pricing_plan        = "P0v3"
  docker_image        = "fhuitelec/examples-api:1.0.0"
  docker_registry_url = "https://ghcr.io"

  app_settings = {
    DATABASE_HOST     = local.database.host
    DATABASE_PORT     = local.database.port
    DATABASE_NAME     = local.database.name
    DATABASE_USER     = local.database.user
    DATABASE_PASSWORD = local.database.password
  }
}

module "database" {
  source = "./modules/database"
  count  = 0

  resource_group_name = local.resource_group
  location            = local.location

  entra_administrator_tenant_id      = data.azurerm_subscription.current.tenant_id
  entra_administrator_object_id      = data.azuread_user.user.object_id
  entra_administrator_principal_type = "User"
  entra_administrator_principal_name = data.azuread_user.user.user_principal_name

  server_name                     = local.database_server_name
  database_administrator_login    = local.database_username
  database_administrator_password = local.database_password
  database_name                   = local.database_name
}
