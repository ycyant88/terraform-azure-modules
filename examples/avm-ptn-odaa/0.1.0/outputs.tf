output "odaa_infra_resource_ids" {
  value       = module.avm-ptn-odaa.odaa_infra_resource_ids
  description = "Resource IDs of the ODAA Infrastructure resources created."
}

output "odaa_vmcluster_resource_ids" {
  value       = module.avm-ptn-odaa.odaa_vmcluster_resource_ids
  description = "Resource IDs of the ODAA VM Cluster resources created."
}

output "odaa_vnets_resource_ids" {
  value       = module.avm-ptn-odaa.odaa_vnets_resource_ids
  description = "Resource IDs of the Virtual networks created"
}

output "resource_id" {
  value       = module.avm-ptn-odaa.resource_id
  description = "Resource ID for tflint compliance"
}
