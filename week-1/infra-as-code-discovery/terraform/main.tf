terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "cb19b88f-dac3-4425-a42b-f1ba6dbc9fc1"
}

resource "azurerm_resource_group" "example" {
  name     = "lol"
  location = "francecentral"
  tags = {
    hello = "world"
  }
}
