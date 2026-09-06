output "public_ip_address" {
  value       = module.avm-res-network-publicipaddress.public_ip_address
  description = "The assigned IP address of the public IP"
}

output "public_ip_id" {
  value       = module.avm-res-network-publicipaddress.public_ip_id
  description = "The ID of the created public IP address"
}
