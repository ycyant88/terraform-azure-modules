output "certificate_url" {
  value       = module.avm-res-web-hostingenvironment.certificate_url
  description = "The URL of the certificate used for the custom DNS suffix."
}

output "dns_suffix" {
  value       = module.avm-res-web-hostingenvironment.dns_suffix
  description = "The custom DNS suffix applied to the ASE."
}

output "key_vault_reference_identity" {
  value       = module.avm-res-web-hostingenvironment.key_vault_reference_identity
  description = "The identity used for resolving the key vault certificate reference."
}

output "provisioning_state" {
  value       = module.avm-res-web-hostingenvironment.provisioning_state
  description = "The provisioning state of the custom DNS suffix configuration."
}

output "resource_id" {
  value       = module.avm-res-web-hostingenvironment.resource_id
  description = "The resource ID of the custom DNS suffix configuration."
}
