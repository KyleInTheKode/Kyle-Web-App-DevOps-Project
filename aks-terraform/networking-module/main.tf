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
}

resource "azurerm_resource_group" "name" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "name" {
  name = "aks-vnet"
  resource_group_name = var.resource_group_name
  address_space = var.vnet_address_space
  location = var.location
}

resource "azurerm_subnet" "name" {
  name = "control-plane-subnet"
  resource_group_name = var.resource_group_name
  address_prefixes = var.vnet_address_space
  virtual_network_name = "aks-vnet"
}

resource "azurerm_subnet" "name2" {
  name = "worker-node-subnet"
  resource_group_name = var.resource_group_name
  address_prefixes = var.vnet_address_space
  virtual_network_name = "aks-vnet"
}


resource "azurerm_network_security_group" "name" {
  name = "aks-nsg"
  location = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name = "kube-apiserver-rule"
    direction = "Inbound"
  }

  security_rule {
    name = "ssh-rule"
    direction = "Inbound"
  }
}