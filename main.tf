# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"

  cloud {
    organization = "songhan"

    workspaces {
      name = "gh-actions-learn"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform-learn"
  location = "southeastasia"
}

## create a blob storage account with name terraform-learn and resource group terraform-learn
resource "azurerm_storage_account" "sa" {
  name                     = "terraformlearnstore"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "southeastasia"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

