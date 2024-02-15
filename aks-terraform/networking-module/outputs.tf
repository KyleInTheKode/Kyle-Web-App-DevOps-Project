output "vnet_id" {
    description = "ID of the Virtual Network"
    value = azurerm_virtual_network.name.id
}

output "control_plane_subnet_id" {
    description = "ID of the control plane subnet"
    value = azurerm_subnet.name.id
}

output "worker_node_subnet_id" {
    description = "ID of the worker node subnet"
    value = azurerm_subnet.name2.id
}

output "networking_resource_group_name" {
    description = "Name of the resource group"
    value = var.resource_group_name
}

output "aks_nsg_id" {
    description = "ID of the Network Security Group"
    value = azurerm_network_security_group.name.id
}