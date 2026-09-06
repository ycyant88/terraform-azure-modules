output "azure_firewall_resource_names" {
  value       = module.avm-ptn-virtualwan.azure_firewall_resource_names
  description = "Azure Firewall resource name"
}

output "resource" {
  value       = module.avm-ptn-virtualwan.resource
  description = "Azure Firewall resource"
}

output "resource_id" {
  value       = module.avm-ptn-virtualwan.resource_id
  description = "Azure Firewall resource ID"
}

output "resource_object" {
  value       = module.avm-ptn-virtualwan.resource_object
  description = "Azure Firewall resource object"
}
