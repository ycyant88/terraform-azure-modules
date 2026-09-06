output "name" {
  value       = module.avm-res-storage-storageaccount.name
  description = "The name of the filesystem."
}

output "resource" {
  value       = module.avm-res-storage-storageaccount.resource
  description = "The full filesystem azapi_resource."
}

output "resource_id" {
  value       = module.avm-res-storage-storageaccount.resource_id
  description = "The resource ID of the underlying container backing the filesystem."
}
