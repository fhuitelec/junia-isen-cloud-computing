terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> X.X.X"
    }
  }
}

provider "azurerm" {
  features {}
}
