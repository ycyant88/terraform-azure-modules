output "error" {
  value       = module.avm-res-app-managedenvironment.error
  description = "Any error occurred during the certificate provision."
}

output "name" {
  value       = module.avm-res-app-managedenvironment.name
  description = "The name of the created resource."
}

output "resource_id" {
  value       = module.avm-res-app-managedenvironment.resource_id
  description = "The ID of the created resource."
}

output "validation_token" {
  value       = module.avm-res-app-managedenvironment.validation_token
  description = "A TXT token used for DNS TXT domain control validation when issuing this type of managed certificates."
}
