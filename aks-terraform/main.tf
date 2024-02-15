terraform {
  required_providers {
    azurem = {
        source = "hashicorp/azurerm"
        version = "=3.0.0"
    }
  }
}

provider "azurem" {
  features{}
  client_id       = var.client_id
  client_secret   = var.client_secret
  #subscription_id = "your-subscription-id"
  #tenant_id       = "your-tenant-id"
}

module "networking" {
  source = "./networking-module"
  resource_group_name = "networking-resource-group"
  vnet_address_space = ["10.0.0.0/16"]
  location = "UK South"
  ip_address = ""
}