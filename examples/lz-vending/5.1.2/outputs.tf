output "budget_resource_id" {
  value       = module.lz-vending.budget_resource_id
  description = "The created budget resource IDs, expressed as a map."
}

output "management_group_subscription_association_id" {
  value       = module.lz-vending.management_group_subscription_association_id
  description = "The management_group_subscription_association_id output is the ID of the management group subscription association.\nValue will be null if var.subscription_management_group_association_enabled is false.\n"
}

output "resource_group_resource_ids" {
  value       = module.lz-vending.resource_group_resource_ids
  description = "The created resource group IDs, expressed as a map."
}

output "route_table_resource_ids" {
  value       = module.lz-vending.route_table_resource_ids
  description = "The created route table resource IDs, expressed as a map."
}

output "subscription_id" {
  value       = module.lz-vending.subscription_id
  description = "The subscription_id is the Azure subscription id that resources have been deployed into."
}

output "subscription_resource_id" {
  value       = module.lz-vending.subscription_resource_id
  description = "The subscription_resource_id is the Azure subscription resource id that resources have been deployed into"
}

output "umi_client_ids" {
  value       = module.lz-vending.umi_client_ids
  description = "The client id of the user managed identity.\nValue will be null if var.umi_enabled is false.\n"
}

output "umi_principal_ids" {
  value       = module.lz-vending.umi_principal_ids
  description = "The principal id of the user managed identity, sometimes known as the object id.\nValue will be null if var.umi_enabled is false.\n"
}

output "umi_resource_ids" {
  value       = module.lz-vending.umi_resource_ids
  description = "The Azure resource id of the user managed identity.\nValue will be null if var.umi_enabled is false.\n"
}

output "umi_tenant_ids" {
  value       = module.lz-vending.umi_tenant_ids
  description = "The tenant id of the user managed identity.\nValue will be null if var.umi_enabled is false.\n"
}

output "virtual_network_resource_group_ids" {
  value       = module.lz-vending.virtual_network_resource_group_ids
  description = "A map of resource group ids, keyed by the var.virtual_networks input map. Only populated if the virtualnetwork submodule is enabled."
}

output "virtual_network_resource_ids" {
  value       = module.lz-vending.virtual_network_resource_ids
  description = "A map of virtual network resource ids, keyed by the var.virtual_networks input map. Only populated if the virtualnetwork submodule is enabled."
}
