output "resource" {
  value       = module.avm-res-network-privatednszone.resource
  description = "The outputs of the virtual network link resource."
}

output "resource_id" {
  value       = module.avm-res-network-privatednszone.resource_id
  description = "The resource ID of the created virtual network link."
}
