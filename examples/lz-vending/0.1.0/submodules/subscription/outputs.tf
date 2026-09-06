output "subscription_id" {
  value       = module.lz-vending.subscription_id
  description = "The subscription_id is the id of the newly created subscription, or that of the supplied var.subscription_id.\nValue will be null if var.subscription_id is blank and var.subscription_alias_enabled is false.\n"
}

output "subscription_resource_id" {
  value       = module.lz-vending.subscription_resource_id
  description = "The subscription_resource_id output is the Azure resource id for the newly created subscription.\nValue will be null if var.subscription_id is blank and var.subscription_alias_enabled is false.\n"
}
