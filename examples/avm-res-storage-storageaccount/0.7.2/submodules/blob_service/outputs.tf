output "resource" {
  value       = module.avm-res-storage-storageaccount.resource
  description = "The full azapi_update_resource object for the blob service."
}

output "resource_id" {
  value       = module.avm-res-storage-storageaccount.resource_id
  description = "The resource ID of the blob service."
}

output "restore_policy_last_enabled_time" {
  value       = module.avm-res-storage-storageaccount.restore_policy_last_enabled_time
  description = "Deprecated in favour of restore_policy_min_restore_time. The last time the restore policy was enabled."
}

output "restore_policy_min_restore_time" {
  value       = module.avm-res-storage-storageaccount.restore_policy_min_restore_time
  description = "The minimum date and time from which the restore can be started."
}
