output "name" {
  value       = module.avm-res-containerservice-managedcluster.name
  description = "The name of the created resource."
}

output "resource_id" {
  value       = module.avm-res-containerservice-managedcluster.resource_id
  description = "The ID of the created resource."
}

output "system_data" {
  value       = module.avm-res-containerservice-managedcluster.system_data
  description = "Metadata pertaining to creation and last modification of the resource."
}

output "type" {
  value       = module.avm-res-containerservice-managedcluster.type
  description = "Resource type"
}
