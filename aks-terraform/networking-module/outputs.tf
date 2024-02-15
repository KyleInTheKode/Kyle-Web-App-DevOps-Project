output "vnet_id" {
    value = azurerm_virtual_network.name.id
}

output "control_plane_subnet_id" {
    value = azurerm_subnet.name.id
}

output "worker_node_subnet_id" {
    value = azurerm_subnet.name2.id
}

output "networking_resource_group_name" {
    value = var.resource_group_name
}

output "aks_nsg_id" {
    value = azurerm_network_security_group.name.id
}