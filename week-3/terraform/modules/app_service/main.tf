resource "azurerm_service_plan" "app_service" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.pricing_plan
}

resource "azurerm_linux_web_app" "app_service" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = azurerm_service_plan.app_service.location
  service_plan_id     = azurerm_service_plan.app_service.id
  app_settings        = var.app_settings

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = var.pricing_plan != "F1"

    application_stack {
      docker_registry_url = var.docker_registry_url
      docker_image_name   = var.docker_image
    }
  }

  logs {
    http_logs {
      file_system {
        retention_in_days = 1
        retention_in_mb   = 50
      }
    }
  }
}
