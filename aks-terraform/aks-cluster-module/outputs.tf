output "aks_cluster_name" {
  description = "Name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.name.name
}

output "aks_cluster_id" {
  description = "ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.name.id
}

output "aks_kubeconfig" {
  description = "Kubeconfig file for accessing the AKS cluster."
  value       = azurerm_kubernetes_cluster.name.kube_config_raw
}