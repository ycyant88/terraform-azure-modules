output "location" {
  value       = module.avm-res-compute-disk.location
  description = "The deployment region."
}

output "private_endpoints" {
  value       = module.avm-res-compute-disk.private_endpoints
  description = "A map of the private endpoints created.\n"
}

output "resource" {
  value       = module.avm-res-compute-disk.resource
  description = "This is the full output for the resource."
}

output "resource_group_name" {
  value       = module.avm-res-compute-disk.resource_group_name
  description = "The name of the Resource Group."
}

output "resource_id" {
  value       = module.avm-res-compute-disk.resource_id
  description = "This is the full output for the resource."
}
