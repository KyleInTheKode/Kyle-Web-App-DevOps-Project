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

resource "azurerm_resource_group" "network_resource_group" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "aks_net" {
  name = "aks-vnet"
  address_space = var.vnet_address_space
  resource_group_name = azurerm_resource_group.network_resource_group.name
  location = azurerm_resource_group.network_resource_group.location
}

resource "azurerm_subnet" "control_plane_subnet" {
  name = "control-plane-subnet"
  resource_group_name = azurerm_resource_group.network_resource_group.name
  address_prefixes = ["10.0.1.0/24"]
  virtual_network_name = "aks-vnet"
}

resource "azurerm_subnet" "worker_node_subnet" {
  name = "worker-node-subnet"
  resource_group_name = azurerm_resource_group.network_resource_group.name
  address_prefixes = ["10.0.1.0/24"]
  virtual_network_name = "aks-vnet"
}


resource "azurerm_network_security_group" "aks_nsg" {
  name = "aks-nsg"
  location = azurerm_resource_group.network_resource_group.location
  resource_group_name = azurerm_resource_group.network_resource_group.name

  security_rule {
    name = "kube-apiserver-rule"
    direction = "Inbound"
    access = "Allow"
    priority = 1001
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "443"
    source_address_prefix = var.ip_address  
    destination_address_prefix = "*"
  }

  security_rule {
    name = "ssh-rule"
    direction = "Inbound"
    access = "Allow"
    priority = 1002
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = var.ip_address  
    destination_address_prefix = "*" 
  }
}