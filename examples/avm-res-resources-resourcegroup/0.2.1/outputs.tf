output "name" {
  value       = module.avm-res-resources-resourcegroup.name
  description = "The name of the resource group"
}

output "resource" {
  value       = module.avm-res-resources-resourcegroup.resource
  description = "This is the full output for the resource group."
}

output "resource_id" {
  value       = module.avm-res-resources-resourcegroup.resource_id
  description = "The resource Id of the resource group"
}
