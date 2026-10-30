output "admin_password" {
  value       = module.avm-res-containerregistry-registry.admin_password
  description = "The password associated with the Container Registry admin account."
}

output "admin_username" {
  value       = module.avm-res-containerregistry-registry.admin_username
  description = "The username associated with the Container Registry admin account."
}

output "cache_rules" {
  value       = module.avm-res-containerregistry-registry.cache_rules
  description = "A map of the Container Registry cache rules created by the module. The map key matches the key supplied to var.cache_rules. Each value exposes discrete attributes:\n\n- name - The name of the cache rule.\n- resource_id - The resource ID of the cache rule.\n"
}

output "credential_sets" {
  value       = module.avm-res-containerregistry-registry.credential_sets
  description = "A map of the Container Registry credential sets created by the module. The map key matches the key supplied to var.credential_sets. Each value exposes discrete attributes:\n\n- name - The name of the credential set.\n- resource_id - The resource ID of the credential set.\n- principal_id - The principal ID of the credential set's system-assigned managed identity. Grant this identity read access to the referenced Key Vault secrets.\n- tenant_id - The tenant ID of the credential set's system-assigned managed identity.\n"
}

output "data_endpoint_host_names" {
  value       = module.avm-res-containerregistry-registry.data_endpoint_host_names
  description = "The host names of the dedicated data endpoints for the Container Registry."
}

output "login_server" {
  value       = module.avm-res-containerregistry-registry.login_server
  description = "The URL used to log in to the Container Registry."
}

output "name" {
  value       = module.avm-res-containerregistry-registry.name
  description = "The name of the parent resource."
}

output "private_endpoints" {
  value       = module.avm-res-containerregistry-registry.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource_id" {
  value       = module.avm-res-containerregistry-registry.resource_id
  description = "The resource id for the parent resource."
}

output "scope_maps" {
  value       = module.avm-res-containerregistry-registry.scope_maps
  description = "A map of scope maps. The map key is the supplied input to var.scope_maps. The map value is the entire scope map module.\nThe scope map module contains the following outputs:\n- id - The ID of the Container Registry Scope Map.\n- registry_tokens - The registry token object.\n  - id - The ID of the Container Registry token.\n  - registry_token_passwords - The registry token password object.\n    - id - The ID of the Container Registry token password.\n    - password1 - The first password object of the token.\n    - password2 - The second password object of the token.\n"
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-res-containerregistry-registry.system_assigned_mi_principal_id
  description = "The system assigned managed identity principal ID of the parent resource."
}

output "system_assigned_mi_tenant_id" {
  value       = module.avm-res-containerregistry-registry.system_assigned_mi_tenant_id
  description = "The system assigned managed identity tenant ID of the parent resource."
}
