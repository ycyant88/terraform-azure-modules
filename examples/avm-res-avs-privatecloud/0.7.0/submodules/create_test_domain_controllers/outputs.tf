output "dc_details" {
  value       = module.avm-res-avs-privatecloud.dc_details
  description = "The primary domain controller data resource output."
}

output "dc_details_secondary" {
  value       = module.avm-res-avs-privatecloud.dc_details_secondary
  description = "The secondary domain controller data resource output."
}

output "domain_distinguished_name" {
  value       = module.avm-res-avs-privatecloud.domain_distinguished_name
  description = "The distinguished name for the domain deployed on the domain controllers."
}

output "domain_fqdn" {
  value       = module.avm-res-avs-privatecloud.domain_fqdn
  description = "The fully qualified domain name for the domain deployed on the domain controllers."
}

output "domain_netbios_name" {
  value       = module.avm-res-avs-privatecloud.domain_netbios_name
  description = "The domain short name or netbios name for the domain deployed on the domain controllers."
}

output "ldap_user" {
  value       = module.avm-res-avs-privatecloud.ldap_user
  description = "The ldap user name created for use in testing the identity configuration functions of the AVM AVS module."
}

output "ldap_user_password" {
  value       = module.avm-res-avs-privatecloud.ldap_user_password
  description = "The ldap user password value for use in testing the identity configuration functions of the AVM AVS module."
}

output "primary_dc_private_ip_address" {
  value       = module.avm-res-avs-privatecloud.primary_dc_private_ip_address
  description = "The IP address for the primary domain controller."
}

output "resource" {
  value       = module.avm-res-avs-privatecloud.resource
  description = "the full module output for the primary domain controller. Including this to comply with the spec tests."
}

output "resource_id" {
  value       = module.avm-res-avs-privatecloud.resource_id
  description = "The primary domain controller id.  Included to comply with the spec."
}
