output "default_predefined_ssl_policy" {
  value       = module.avm-res-network-applicationgateway.default_predefined_ssl_policy
  description = "Ssl predefined policy name enums."
}

output "identity_principal_id" {
  value       = module.avm-res-network-applicationgateway.identity_principal_id
  description = "The principal id of the system assigned identity. This property will only be provided for a system assigned identity."
}

output "identity_tenant_id" {
  value       = module.avm-res-network-applicationgateway.identity_tenant_id
  description = "The tenant id of the system assigned identity. This property will only be provided for a system assigned identity."
}

output "name" {
  value       = module.avm-res-network-applicationgateway.name
  description = "The name of the created resource."
}

output "operational_state" {
  value       = module.avm-res-network-applicationgateway.operational_state
  description = "Operational state of the application gateway resource."
}

output "private_endpoint_connections" {
  value       = module.avm-res-network-applicationgateway.private_endpoint_connections
  description = "Private Endpoint connections on application gateway."
}

output "provisioning_state" {
  value       = module.avm-res-network-applicationgateway.provisioning_state
  description = "The current provisioning state."
}

output "resource_guid" {
  value       = module.avm-res-network-applicationgateway.resource_guid
  description = "The resource GUID property of the application gateway resource."
}

output "resource_id" {
  value       = module.avm-res-network-applicationgateway.resource_id
  description = "The ID of the created resource."
}

output "type" {
  value       = module.avm-res-network-applicationgateway.type
  description = "Resource type."
}
