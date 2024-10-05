# Terraform configuration

terraform {
  backend "local" {
    path = "./.tfstate/terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.3"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.3.0"
    }
  }
  required_version = "~> 1.9"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
