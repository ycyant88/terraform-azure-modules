output "custom_domain_verification_id" {
  value       = module.avm-res-app-managedenvironment.custom_domain_verification_id
  description = "The custom domain verification ID of the Container Apps Managed Environment."
}

output "dapr_component_resource_ids" {
  value       = module.avm-res-app-managedenvironment.dapr_component_resource_ids
  description = "A map of dapr components connected to this environment. The map key is the supplied input to var.dapr_components. The map value is the azurerm-formatted version of the entire dapr_components resource."
}

output "default_domain" {
  value       = module.avm-res-app-managedenvironment.default_domain
  description = "The default domain of the Container Apps Managed Environment."
}

output "docker_bridge_cidr" {
  value       = module.avm-res-app-managedenvironment.docker_bridge_cidr
  description = "The Docker bridge CIDR of the Container Apps Managed Environment."
}

output "id" {
  value       = module.avm-res-app-managedenvironment.id
  description = "The ID of the container app management environment resource."
}

output "infrastructure_resource_group" {
  value       = module.avm-res-app-managedenvironment.infrastructure_resource_group
  description = "The infrastructure resource group of the Container Apps Managed Environment."
}

output "managed_identities" {
  value       = module.avm-res-app-managedenvironment.managed_identities
  description = "The managed identities assigned to the Container Apps Managed Environment."
}

output "name" {
  value       = module.avm-res-app-managedenvironment.name
  description = "The name of the resource"
}

output "platform_reserved_cidr" {
  value       = module.avm-res-app-managedenvironment.platform_reserved_cidr
  description = "The platform reserved CIDR of the Container Apps Managed Environment."
}

output "platform_reserved_dns_ip_address" {
  value       = module.avm-res-app-managedenvironment.platform_reserved_dns_ip_address
  description = "The platform reserved DNS IP address of the Container Apps Managed Environment."
}

output "resource_id" {
  value       = module.avm-res-app-managedenvironment.resource_id
  description = "The ID of the container app management environment resource."
}

output "static_ip_address" {
  value       = module.avm-res-app-managedenvironment.static_ip_address
  description = "The static IP address of the Container Apps Managed Environment."
}

output "storage_resource_ids" {
  value       = module.avm-res-app-managedenvironment.storage_resource_ids
  description = "A map of storage shares connected to this environment. The map key is the supplied input to var.storages. The map value is the azurerm-formatted version of the entire storage shares resource."
}
