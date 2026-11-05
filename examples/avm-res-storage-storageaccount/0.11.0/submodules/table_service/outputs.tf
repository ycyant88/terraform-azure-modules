output "resource" {
  value       = module.avm-res-storage-storageaccount.resource
  description = "The full azapi_update_resource object for the table service."
}

output "resource_id" {
  value       = module.avm-res-storage-storageaccount.resource_id
  description = "The resource ID of the table service."
}
