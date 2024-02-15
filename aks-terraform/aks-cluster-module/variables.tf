variable "aks_cluster_name" {
  description = "The name of the AKS cluster you wish to create"
  type = string
}

variable "cluster_location" {
  description = "The Azure region where the AKS cluster will be deployed to"
  type = string
}

variable "dns_prefix" {
  description = "The DNS prefix of cluster"
  type = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes the cluster will use"
  type = string
}

variable "service_principal_client_id" {
  description = "Provides the Client ID for the service principal associated with the cluste. This should have a unique name so permissions are not overrided by others"
  type = string
}

variable "service_principal_secret" {
  description = "Supplies the Client Secret for the service principal"
  type = string
}

variable "vnet_id" {
    description = "ID of the Virtual Network"
    type = string
}

variable "control_plane_subnet_id" {
    description = "ID of the control plane subnet"
    type = string
}

variable "worker_node_subnet_id" {
    description = "ID of the worker node subnet"
    type = string
}

variable "networking_resource_group_name" {
    description = "Name of the resource group"
    type = string
}