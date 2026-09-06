output "identity" {
  value       = module.avm-res-sql-managedinstance.identity
  description = "Managed identities for the SQL MI instance.  This is not available from the resource output because AzureRM doesn't yet support adding both User and System Assigned identities."
}

output "private_endpoints" {
  value       = module.avm-res-sql-managedinstance.private_endpoints
  description = "  A map of the private endpoints created.\n"
}

output "resource" {
  value       = module.avm-res-sql-managedinstance.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-sql-managedinstance.resource_id
  description = "This is the resource ID of the resource."
}
