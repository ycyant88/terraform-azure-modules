output "backup_protected_vm" {
  value       = module.avm-res-recoveryservices-vault.backup_protected_vm
  description = "Resource ID of the workload backup policy"
}

output "private_endpoints" {
  value       = module.avm-res-recoveryservices-vault.private_endpoints
  description = "  A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource.\"\n"
}

output "recovery_services_vault_file_share_policy" {
  value       = module.avm-res-recoveryservices-vault.recovery_services_vault_file_share_policy
  description = "Resource ID of the file share backup policy"
}

output "recovery_services_vault_resource_guard_association" {
  value       = module.avm-res-recoveryservices-vault.recovery_services_vault_resource_guard_association
  description = "Resource Guard association for the Recovery Services Vault"
}

output "recovery_services_vault_vm_policy" {
  value       = module.avm-res-recoveryservices-vault.recovery_services_vault_vm_policy
  description = "Resource ID of the VM backup policy"
}

output "recovery_workload_policy" {
  value       = module.avm-res-recoveryservices-vault.recovery_workload_policy
  description = "Resource ID of the VM backup policy"
}

output "resource" {
  value       = module.avm-res-recoveryservices-vault.resource
  description = "resource Id output"
}

output "resource_id" {
  value       = module.avm-res-recoveryservices-vault.resource_id
  description = "resource Id output"
}

output "site_recovery_replicated_vm" {
  value       = module.avm-res-recoveryservices-vault.site_recovery_replicated_vm
  description = "The site recovery replicated VM resources"
}
