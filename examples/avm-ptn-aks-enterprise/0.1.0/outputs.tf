output "resource" {
  value       = module.avm-ptn-aks-enterprise.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-ptn-aks-enterprise.resource_id
  description = "The azurerm_kubernetes_cluster's resource id."
}
