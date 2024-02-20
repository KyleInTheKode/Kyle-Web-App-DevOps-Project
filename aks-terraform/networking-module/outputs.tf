output "vnet_id" {
    description = "ID of the Virtual Network"
    value = azurerm_virtual_network.aks_net.id
}

output "control_plane_subnet_id" {
    description = "ID of the control plane subnet"
    value = azurerm_subnet.control_plane_subnet.id
}

output "worker_node_subnet_id" {
    description = "ID of the worker node subnet"
    value = azurerm_subnet.worker_node_subnet.id
}

output "networking_resource_group_name" {
    description = "Name of the resource group"
    value = azurerm_resource_group.network_resource_group.name
}

output "aks_nsg_id" {
    description = "ID of the Network Security Group"
    value = azurerm_network_security_group.aks_nsg.id
}