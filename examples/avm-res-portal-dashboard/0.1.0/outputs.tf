output "dashboard" {
  value       = module.avm-res-portal-dashboard.dashboard
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-portal-dashboard.resource_id
  description = "The ID of the Azure portal dashboard resource."
}
