output "public_ip_prefix_value" {
  value       = module.avm-res-network-natgateway.public_ip_prefix_value
  description = "The CIDR provisioned for the public IP prefix"
}

output "resource" {
  value       = module.avm-res-network-natgateway.resource
  description = "The NAT Gateway resource."
}

output "resource_id" {
  value       = module.avm-res-network-natgateway.resource_id
  description = "The ID of the NAT Gateway."
}
