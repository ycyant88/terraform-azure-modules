output "credentials" {
  value       = module.avm-res-avs-privatecloud.credentials
  description = "This value returns the vcenter and nsxt cloudadmin credential values."
}

output "hcx_cloud_manager_endpoint_hostname" {
  value       = module.avm-res-avs-privatecloud.hcx_cloud_manager_endpoint_hostname
  description = "The hcx cloud manager's hostname"
}

output "hcx_cloud_manager_endpoint_https" {
  value       = module.avm-res-avs-privatecloud.hcx_cloud_manager_endpoint_https
  description = "The full https endpoint for hcx cloud manager"
}

output "identity" {
  value       = module.avm-res-avs-privatecloud.identity
  description = "This output returns the managed identity values if the managed identity has been enabled on the module."
}

output "nsxt_manager_endpoint_hostname" {
  value       = module.avm-res-avs-privatecloud.nsxt_manager_endpoint_hostname
  description = "The nsxt endpoint's hostname"
}

output "nsxt_manager_endpoint_https" {
  value       = module.avm-res-avs-privatecloud.nsxt_manager_endpoint_https
  description = "The full https endpoint for nsxt manager."
}

output "public_ip" {
  value       = module.avm-res-avs-privatecloud.public_ip
  description = "The public IP prefixes when a public ip config is configured for the private cloud."
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

output "vcsa_endpoint_hostname" {
  value       = module.avm-res-avs-privatecloud.vcsa_endpoint_hostname
  description = "The vcsa endpoint's hostname"
}

output "vcsa_endpoint_https" {
  value       = module.avm-res-avs-privatecloud.vcsa_endpoint_https
  description = "The full https endpoint for vcsa."
}
