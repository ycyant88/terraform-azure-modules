output "credentials" {
  value       = module.avm-res-avs-privatecloud.credentials
  description = "This value returns the vcenter and nsxt cloudadmin credential values."
}

output "identity" {
  value       = module.avm-res-avs-privatecloud.identity
  description = "This output returns the managed identity values if the managed identity has been enabled on the module."
}

output "resource" {
  value       = module.avm-res-avs-privatecloud.resource
  description = "This output returns the full private cloud resource object properties."
}

output "resource_id" {
  value       = module.avm-res-avs-privatecloud.resource_id
  description = "The azure resource if of the private cloud."
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-res-avs-privatecloud.system_assigned_mi_principal_id
  description = "The principal id of the system managed identity assigned to the virtual machine"
}
