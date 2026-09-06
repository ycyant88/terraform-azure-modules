output "all_principals" {
  value       = module.avm-res-authorization-roleassignment.all_principals
  description = "A map of all principals. The key is the key you supplied and the value is the principal id (object id) of the user, group, service principal, or managed identity.\n"
}

output "app_registrations" {
  value       = module.avm-res-authorization-roleassignment.app_registrations
  description = "A map of Entra ID application registrations. The key is the key you supplied and the value is the principal id (object id) of the service principal backing the application registration."
}

output "entra_id_role_assignments" {
  value       = module.avm-res-authorization-roleassignment.entra_id_role_assignments
  description = "A map of Entra ID role assignments. The key is the key you supplied and the value is the role assignment details:\n\n- role_definition_id: The role definition template id of the role assignment.\n- principal_id: The principal id (object id) of the user, group, service principal, or managed identity the role assignment is for.\n"
}

output "entra_id_role_definitions" {
  value       = module.avm-res-authorization-roleassignment.entra_id_role_definitions
  description = "A map of Entra ID role definitions. The key is the key you supplied and the value is the role definition template id."
}

output "groups" {
  value       = module.avm-res-authorization-roleassignment.groups
  description = "A map of Entra ID groups. The key is the key you supplied and the value is the principal id (object id) of the group."
}

output "role_assignments" {
  value       = module.avm-res-authorization-roleassignment.role_assignments
  description = "A map of Azure Resource Manager role assignments. The key is the key you supplied and the value is the role assignment details:\n\n- role_definition_id: The role definition id of the role assignment.\n- principal_id: The principal id (object id) of the user, group, service principal, or managed identity the role assignment is for.\n- scope: The scope of the role assignment.\n"
}

output "role_defintions" {
  value       = module.avm-res-authorization-roleassignment.role_defintions
  description = "A map of Azure Resource Manager role definitions. The key is the key you supplied and the value consists of is the role definition id and the allowed scopes."
}

output "system_assigned_managed_identities" {
  value       = module.avm-res-authorization-roleassignment.system_assigned_managed_identities
  description = "A map of system assigned managed identities. The key is the key you supplied and value is the principal id (object id) of the service principal backing system assigned managed identity."
}

output "user_assigned_managed_identities" {
  value       = module.avm-res-authorization-roleassignment.user_assigned_managed_identities
  description = "A map of user assigned managed identities. The key is the key you supplied and value is the principal id (object id) of the service principal backing user assigned managed identity."
}

output "users" {
  value       = module.avm-res-authorization-roleassignment.users
  description = "A map of Entra ID users. The key is the key you supplied and the value is the principal id (object id) of the user."
}
