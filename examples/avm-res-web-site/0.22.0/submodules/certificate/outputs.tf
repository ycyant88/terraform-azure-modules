output "expiration_date" {
  value       = module.avm-res-web-site.expiration_date
  description = "The certificate's expiration date."
}

output "issuer" {
  value       = module.avm-res-web-site.issuer
  description = "The certificate issuer."
}

output "key_vault_secret_status" {
  value       = module.avm-res-web-site.key_vault_secret_status
  description = "The status of the Key Vault secret poll. Useful for diagnosing missing RBAC grants."
}

output "name" {
  value       = module.avm-res-web-site.name
  description = "The name of the certificate."
}

output "resource" {
  value       = module.avm-res-web-site.resource
  description = "The full resource object."
}

output "resource_id" {
  value       = module.avm-res-web-site.resource_id
  description = "The resource ID of the certificate."
}

output "subject_name" {
  value       = module.avm-res-web-site.subject_name
  description = "The certificate subject name."
}

output "thumbprint" {
  value       = module.avm-res-web-site.thumbprint
  description = "The thumbprint of the certificate. Pass this value into custom_domains[*].thumbprint to bind the certificate to a hostname."
}
