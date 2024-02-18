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
  subscription_id = "32e2564f-55ed-48e1-b93d-d8bb039fde79"
  tenant_id       = "47d4542c-f112-47f4-92c7-a838d8a5e8ef"
}

module "networking" {
  source = "./networking-module"
  resource_group_name = "networking-resource-group"
  vnet_address_space = ["10.0.0.0/16"]
  location = "UK South"
  ip_address = var.ip_address
}

module "cluster" {
  source = "./aks-cluster-module"
  aks_cluster_name = "terraform-aks-cluster"
  cluster_location = "UK South"
  dns_prefix = "myaks-project"
  kubernetes_version = "1.26.6"
  service_principal_client_id = var.client_id
  service_principal_secret = var.client_secret

  networking_resource_group_name = module.networking.networking_resource_group_name
  vnet_id = module.networking.vnet_id
  control_plane_subnet_id = module.networking.control_plane_subnet_id
  worker_node_subnet_id = module.networking.worker_node_subnet_id
  aks_nsg_id = module.networking.aks_nsg_id
}