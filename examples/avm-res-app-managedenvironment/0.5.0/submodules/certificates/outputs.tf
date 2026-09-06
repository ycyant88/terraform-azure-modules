output "deployment_errors" {
  value       = module.avm-res-app-managedenvironment.deployment_errors
  description = "Any errors that occurred during deployment or deployment validation"
}

output "expiration_date" {
  value       = module.avm-res-app-managedenvironment.expiration_date
  description = "Certificate expiration date."
}

output "issue_date" {
  value       = module.avm-res-app-managedenvironment.issue_date
  description = "Certificate issue Date."
}

output "issuer" {
  value       = module.avm-res-app-managedenvironment.issuer
  description = "Certificate issuer."
}

output "name" {
  value       = module.avm-res-app-managedenvironment.name
  description = "The name of the created resource."
}

output "public_key_hash" {
  value       = module.avm-res-app-managedenvironment.public_key_hash
  description = "Public key hash."
}

output "resource_id" {
  value       = module.avm-res-app-managedenvironment.resource_id
  description = "The ID of the created resource."
}

output "subject_alternative_names" {
  value       = module.avm-res-app-managedenvironment.subject_alternative_names
  description = "Subject alternative names the certificate applies to."
}

output "subject_name" {
  value       = module.avm-res-app-managedenvironment.subject_name
  description = "Subject name of the certificate."
}

output "thumbprint" {
  value       = module.avm-res-app-managedenvironment.thumbprint
  description = "Certificate thumbprint."
}

output "valid" {
  value       = module.avm-res-app-managedenvironment.valid
  description = "Is the certificate valid?."
}
