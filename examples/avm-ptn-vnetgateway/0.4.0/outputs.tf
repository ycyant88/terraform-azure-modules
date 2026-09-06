output "local_network_gateways" {
  value       = module.avm-ptn-vnetgateway.local_network_gateways
  description = "A curated output of the Local Network Gateways created by this module."
}

output "public_ip_addresses" {
  value       = module.avm-ptn-vnetgateway.public_ip_addresses
  description = "A curated output of the Public IP Addresses created by this module."
}

output "route_table" {
  value       = module.avm-ptn-vnetgateway.route_table
  description = "A curated output of the Route Table created by this module."
}

output "subnet" {
  value       = module.avm-ptn-vnetgateway.subnet
  description = "A curated output of the GatewaySubnet created by this module."
}

output "virtual_network_gateway" {
  value       = module.avm-ptn-vnetgateway.virtual_network_gateway
  description = "A curated output of the Virtual Network Gateway created by this module."
}

output "virtual_network_gateway_connections" {
  value       = module.avm-ptn-vnetgateway.virtual_network_gateway_connections
  description = "A curated output of the Virtual Network Gateway Connections created by this module."
}
