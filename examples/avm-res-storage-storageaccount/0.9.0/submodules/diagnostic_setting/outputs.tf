output "names" {
  value       = module.avm-res-storage-storageaccount.names
  description = "Map from input key to the generated diagnostic setting name."
}

output "resource_ids" {
  value       = module.avm-res-storage-storageaccount.resource_ids
  description = "Map from input key to the resource ID of the diagnostic setting."
}

output "resources" {
  value       = module.avm-res-storage-storageaccount.resources
  description = "Map from input key to the full diagnostic setting azapi_resource."
}
