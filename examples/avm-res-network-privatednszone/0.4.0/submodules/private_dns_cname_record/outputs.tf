output "resource" {
  value       = module.avm-res-network-privatednszone.resource
  description = "The outputs of the DNS record resource."
}

output "resource_id" {
  value       = module.avm-res-network-privatednszone.resource_id
  description = "The resource ID of the created DNS record."
}
