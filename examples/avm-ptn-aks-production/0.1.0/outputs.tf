output "resource" {
  value       = module.avm-ptn-aks-production.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-ptn-aks-production.resource_id
  description = "The azurerm_kubernetes_cluster's resource id."
}
