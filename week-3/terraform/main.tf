terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_subscription" "current" {
}

data "azuread_user" "user" {
  user_principal_name = var.email_address
}

resource "azurerm_resource_group" "week_3" {
  name     = "week-3"
  location = "francecentral"
}

resource "azurerm_postgresql_flexible_server" "playground_computing" {
  administrator_login           = var.database_username
  administrator_password        = var.database_password
  auto_grow_enabled             = false
  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false
  location                      = "francecentral"
  name                          = var.server_hostname_prefix
  public_network_access_enabled = true
  resource_group_name           = azurerm_resource_group.week_3.name
  sku_name                      = "GP_Standard_D4ds_v5"
  storage_tier                  = "P10"
  version                       = "16"
  zone                          = "1"

  authentication {
    active_directory_auth_enabled = true
    password_auth_enabled         = true
    tenant_id                     = data.azurerm_subscription.current.tenant_id
  }
}

resource "azurerm_postgresql_flexible_server_active_directory_administrator" "administrator" {
    tenant_id           = data.azurerm_subscription.current.tenant_id
    resource_group_name = azurerm_resource_group.week_3.name
    server_name         = azurerm_postgresql_flexible_server.playground_computing.name
    principal_type      = "User"
    object_id           = data.azuread_user.user.object_id
    principal_name      = data.azuread_user.user.user_principal_name
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_all" {
  name             = "AllowAll"
  server_id        = azurerm_postgresql_flexible_server.playground_computing.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}

resource "azurerm_postgresql_flexible_server_database" "database" {
    name      = var.database_name
    server_id = azurerm_postgresql_flexible_server.playground_computing.id
}
