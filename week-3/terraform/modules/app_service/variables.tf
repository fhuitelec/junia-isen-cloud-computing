variable "resource_group_name" {
  type        = string
  nullable = false
  description = "Name of the resource group within which to create the app service"
}

variable "location" {
  type        = string
  nullable = false
  description = "Name of the location where to create the app service"
}

variable "app_name" {
  type        = string
  default     = null
  description = "Name of the application"
}

variable "pricing_plan" {
  type        = string
  default     = "F1"
  description = "SKU for the pricing plan"

  validation {
    condition = contains([
      "B1", "B2", "B3", "D1", "F1", "I1", "I2", "I3", "I1v2",
      "I2v2", "I3v2", "I4v2", "I5v2", "I6v2", "P1v2", "P2v2",
      "P3v2", "P0v3", "P1v3", "P2v3", "P3v3", "P1mv3", "P2mv3",
      "P3mv3", "P4mv3", "P5mv3", "S1", "S2", "S3", "SHARED",
      "EP1", "EP2", "EP3", "FC1", "WS1", "WS2", "WS3", "Y1"
    ], var.pricing_plan)
    error_message = "The pricing plan must be a valid SKU. See https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan#sku_name."
  }
}

variable "docker_image" {
  type = string
  nullable = false
}

variable "docker_registry_url" {
  type = string
  default = "https://index.docker.io"
}

variable "app_settings" {
  description = "App service settings (list of environment variables)"
  default = {}
  type = map(string)
}
