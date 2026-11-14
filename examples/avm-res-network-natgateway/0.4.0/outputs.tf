output "public_ip_resource" {
  value       = module.avm-res-network-natgateway.public_ip_resource
  description = "The public IP resource."
}

output "resource" {
  value       = module.avm-res-network-natgateway.resource
  description = "The NAT Gateway resource."
}

output "resource_id" {
  value       = module.avm-res-network-natgateway.resource_id
  description = "The ID of the NAT Gateway."
}
