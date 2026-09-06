output "identity" {
  value       = module.avm-res-sql-managedinstance.identity
  description = "Managed identities for the SQL MI instance.  This is not available from the resource output because AzureRM doesn't yet support adding both User and System Assigned identities."
}

output "is_general_purpose_v2" {
  value       = module.avm-res-sql-managedinstance.is_general_purpose_v2
  description = "Whether the SQL Managed Instance is using the Next-gen General Purpose (GPv2) service tier."
}

output "memory_size_in_gb" {
  value       = module.avm-res-sql-managedinstance.memory_size_in_gb
  description = "The actual memory size in GB allocated to the SQL Managed Instance."
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

output "service_principal" {
  value       = module.avm-res-sql-managedinstance.service_principal
  description = "The system-assigned service principal details for the SQL Managed Instance. Required for Windows Authentication with Microsoft Entra ID."
}

output "storage_iops" {
  value       = module.avm-res-sql-managedinstance.storage_iops
  description = "The actual storage IOPS allocated to the SQL Managed Instance."
}
