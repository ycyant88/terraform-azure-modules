output "resource" {
  value       = module.avm-res-storage-storageaccount.resource
  description = "The full management policy azapi_resource."
}

output "resource_id" {
  value       = module.avm-res-storage-storageaccount.resource_id
  description = "The resource ID of the management policy."
}
