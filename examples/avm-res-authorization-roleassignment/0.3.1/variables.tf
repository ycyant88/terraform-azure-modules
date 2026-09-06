variable "app_registrations_by_client_id" {
  description = "(Optional) A map of Entra ID application registrations to reference in role assignments.\nThe key is something unique to you. The value is the client ID (application ID) of the application registration.\n\nExample Input:\n\nhcl\napp_registrations_by_client_id = {\n  my-app-1 = \"00000000-0000-0000-0000-000000000001\"\n  my-app-2 = \"00000000-0000-0000-0000-000000000002\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "app_registrations_by_display_name" {
  description = "(Optional) A map of Entra ID application registrations to reference in role assignments.\nThe key is something unique to you. The value is the display name of the application registration.\n\nExample Input:\n\nhcl\napp_registrations_by_display_name = {\n  my-app-1 = \"My App 1\"\n  my-app-2 = \"My App 2\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "app_registrations_by_object_id" {
  description = "(Optional) A map of Entra ID application registrations to reference in role assignments.\nThe key is something unique to you. The value is the object ID of the application registration.\n\nExample Input:\n\nhcl\napp_registrations_by_object_id = {\n  my-app-1 = \"00000000-0000-0000-0000-000000000001\"\n  my-app-2 = \"00000000-0000-0000-0000-000000000002\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "app_registrations_by_principal_id" {
  description = "(Optional) A map of Entra ID application registrations to reference in role assignments.\nThe key is something unique to you. The value is the principal ID of the service principal backing the application registration.\n\nExample Input:\n\nhcl\napp_registrations_by_principal_id = {\n  my-app-1 = \"00000000-0000-0000-0000-000000000001\"\n  my-app-2 = \"00000000-0000-0000-0000-000000000002\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "entra_id_role_definitions" {
  description = "(Optional) A map of Entra ID role definitions to reference in role assignments.\nThe key is something unique to you. The value is a built in or custom role definition name.\n\n- template_id - (Optional) The template ID of the role definition.\n- display_name - (Optional) The display name of the role definition.\n\nExample Input:\n\nhcl\nentra_id_role_definitions = {\n  directory-writer = {\n    display_name = \"Directory Writer\"\n  }\n  global-administrator = {\n    display_name = \"Global Administrator\"\n  }\n  custom_role_by_name = {\n    display_name = \"Custom Role\"\n  }\n  custom_role_by_id = {\n    template_id = \"00000000-0000-0000-0000-000000000000\"\n  }\n}\n\n"
  type = map(object({
    template_id  = optional(string)
    display_name = optional(string)
  }))
  default = {}
}

variable "groups_by_display_name" {
  description = "(Optional) A map of Entra ID groups to reference in role assignments.\nThe key is something unique to you. The value is the display name of the group.\n\nExample Input:\n\nhcl\ngroups_by_display_name = {\n  my-group-1 = \"My Group 1\"\n  my-group-2 = \"My Group 2\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "groups_by_mail_nickname" {
  description = "(Optional) A map of Entra ID groups to reference in role assignments.\nThe key is something unique to you. The value is the mail nickname of the group.\n\nExample Input:\n\nhcl\ngroups_by_mail_nickname = {\n  my-group-1 = \"my-group-1-nickname\"\n  my-group-2 = \"my-group-2-nickname\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "groups_by_object_id" {
  description = "(Optional) A map of Entra ID groups to reference in role assignments.\nThe key is something unique to you. The value is the object ID of the group.\n\nExample Input:\n\nhcl\ngroups_by_object_id = {\n  my-group-1 = \"00000000-0000-0000-0000-000000000001\"\n  my-group-2 = \"00000000-0000-0000-0000-000000000002\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "role_assignments_azure_resource_manager" {
  description = "Basic Azure Resource Manager role assignments to create. This variable does not do any validation that principals or roles exist and you need to supply the principalID, scope, and roleDefinitionID or roleDefinitionName yourself.\nThe key is something unique to you. The value is a map of role assignment attributes.\n\n- role_definition_id - (Optional) The ID of the role definition to assign.\n- role_definition_name - (Optional) The name of the role definition to assign.\n- principal_type - (Optional) The type of principal to assign the role to. Possible values are User, Group, ServicePrincipal, SystemAssignedManagedIdentity, UserAssignedManagedIdentity.\n- principal_id - The ID of the principal to assign the role to.\n- scope - The scope at which the role assignment applies.\n- condition - (Optional) The condition under which the role assignment is active.\n- condition_version - (Optional) The version of the condition.\n- delegated_managed_identity_resource_id - (Optional) The resource ID of the delegated managed identity.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check - (Optional) If set to true, the service principal AAD check is skipped. This is useful for role assignments where the Service Principal is newly created and not yet available in AAD. Defaults to false.\n"
  type = map(object({
    role_definition_id                     = optional(string)
    role_definition_name                   = optional(string)
    principal_type                         = optional(string)
    principal_id                           = string
    scope                                  = string
    condition                              = optional(string)
    condition_version                      = optional(string)
    delegated_managed_identity_resource_id = optional(string)
    description                            = optional(string)
    skip_service_principal_aad_check       = optional(bool, false)
  }))
  default = {}
}

variable "role_assignments_entra_id" {
  description = "Azure AD role assignments to create for Entra ID. This variable does not do any validation that principals or roles exist and you need to supply the principalObjectID and roleID yourself.\n\n- app_scope_id - (Optional) The scope ID of the app.\n- directory_scope_id - (Optional) The scope ID of the directory.\n- principal_object_id - The object ID of the principal to assign the role to.\n- role_id - The ID of the role to assign.\n"
  type = map(object({
    app_scope_id        = optional(string)
    directory_scope_id  = optional(string)
    principal_object_id = string
    role_id             = string
  }))
  default = {}
}

variable "role_assignments_for_entra_id" {
  description = "(Optional) Role assignments to be applied to Entra ID.\nThis variable allows the assignment of Entra ID directory roles outside of the scope of Azure Resource Manager.\nThis variable requires the entra_id_role_definitions variable to be populated.\n\n- role_assignments: (Required) The role assignments to be applied to the scope.\n  - role_definition: (Required) The key of the role definition as defined in the entra_id_role_definitions variable.\n  - users: (Optional) The keys of the users as defined in one of the users_by_... variables.\n  - groups: (Optional) The keys of the groups as defined in one of the groups_by_... variables.\n  - app_registrations: (Optional) The keys of the app registrations as defined in one of the app_registrations_by_... variables.\n  - system_assigned_managed_identities: (Optional) The keys of the system assigned managed identities as defined in one of the system_assigned_managed_identities_by_... variables.\n  - user_assigned_managed_identities: (Optional) The keys of the user assigned managed identities as defined in one of the user_assigned_managed_identities_by_... variables.\n  - any_principals: (Optional) The keys of the principals as defined in any of the [principal_type]_by_... variables. This is a convenience method that can be used in combination with or instrad of the specific principal type options.\n\nExample Input:\n\nhcl\nrole_assignments_for_entra_id = {\n  role_assignments    = {\n    role_definition = \"directory-writer\"\n    users = [\n      \"my-user-1\",\n      \"my-user-2\"\n    ]\n    groups = [\n      \"my-group-1\",\n      \"my-group-2\"\n    ]\n    app_registrations = [\n      \"my-app-1\",\n      \"my-app-2\"\n    ]\n    system_assigned_managed_identities = [\n      \"my-vm-1\",\n      \"my-vm-2\"\n    ]\n    user_assigned_managed_identities = [\n      \"my-user-assigned-managed-identity-1\",\n      \"my-user-assigned-managed-identity-2\"\n    ]\n  }\n}\n\n"
  type = map(object({
    role_assignments = map(object({
      role_definition                    = string
      users                              = optional(set(string), [])
      groups                             = optional(set(string), [])
      app_registrations                  = optional(set(string), [])
      system_assigned_managed_identities = optional(set(string), [])
      user_assigned_managed_identities   = optional(set(string), [])
      any_principals                     = optional(set(string), [])
    }))
  }))
  default = {}
}

variable "role_assignments_for_management_groups" {
  description = "(Optional) Role assignments to be applied to management groups.\nThis is a convenience variable that avoids the need to find the resource id of the management group.\n\n- management_group_id: (Optional) The id of the management group (one of management_group_id or management_group_display_name must be supplied).\n- management_group_display_name: (Optional) The display name of the management group.\n- role_assignments: (Required) The role assignments to be applied to the scope.\n  - role_definition: (Required) The key of the role definition as defined in the role_definitions variable.\n  - users: (Optional) The keys of the users as defined in one of the users_by_... variables.\n  - groups: (Optional) The keys of the groups as defined in one of the groups_by_... variables.\n  - app_registrations: (Optional) The keys of the app registrations as defined in one of the app_registrations_by_... variables.\n  - system_assigned_managed_identities: (Optional) The keys of the system assigned managed identities as defined in one of the system_assigned_managed_identities_by_... variables.\n  - user_assigned_managed_identities: (Optional) The keys of the user assigned managed identities as defined in one of the user_assigned_managed_identities_by_... variables.\n  - any_principals: (Optional) The keys of the principals as defined in any of the [principal_type]_by_... variables. This is a convenience method that can be used in combination with or instrad of the specific principal type options.\n  - skip_service_principal_aad_check: (Optional) If set to true, the service principal AAD check is skipped. This is useful for role assignments where the Service Principal is newly created and not yet available in AAD. Defaults to false.\n\nExample Input:\n\nhcl\nrole_assignments_for_management_groups = {\n  management_group_id = \"mg-1-id\"\n  role_assignments    = {\n    role_definition = \"contributor\"\n    users = [\n      \"my-user-1\",\n      \"my-user-2\"\n    ]\n    groups = [\n      \"my-group-1\",\n      \"my-group-2\"\n    ]\n    app_registrations = [\n      \"my-app-1\",\n      \"my-app-2\"\n    ]\n    system_assigned_managed_identities = [\n      \"my-vm-1\",\n      \"my-vm-2\"\n    ]\n    user_assigned_managed_identities = [\n      \"my-user-assigned-managed-identity-1\",\n      \"my-user-assigned-managed-identity-2\"\n    ]\n  }\n}\n\nrole_assignments_for_management_groups = {\n  management_group_display_name = \"mg-1-display-name\"\n  role_assignments              = {\n    role_definition = \"contributor\"\n    users = [\n      \"my-user-1\",\n      \"my-user-2\"\n    ]\n    groups = [\n      \"my-group-1\",\n      \"my-group-2\"\n    ]\n    app_registrations = [\n      \"my-app-1\",\n      \"my-app-2\"\n    ]\n    system_assigned_managed_identities = [\n      \"my-vm-1\",\n      \"my-vm-2\"\n    ]\n    user_assigned_managed_identities = [\n      \"my-user-assigned-managed-identity-1\",\n      \"my-user-assigned-managed-identity-2\"\n    ]\n  }\n}\n\n"
  type = map(object({
    management_group_id           = optional(string, null)
    management_group_display_name = optional(string, null)
    role_assignments = map(object({
      role_definition                    = string
      users                              = optional(set(string), [])
      groups                             = optional(set(string), [])
      app_registrations                  = optional(set(string), [])
      system_assigned_managed_identities = optional(set(string), [])
      user_assigned_managed_identities   = optional(set(string), [])
      any_principals                     = optional(set(string), [])
      skip_service_principal_aad_check   = optional(bool, false)
    }))
  }))
  default = {}
}

variable "role_assignments_for_resource_groups" {
  description = "(Optional) Role assignments to be applied to resource groups.\nThe resource group can be in the current subscription (default) or a subscription_id can be supplied to target a resource group in another subscription.\nThis is a convenience variable that avoids the need to find the resource id of the resource group.\n\n- resource_group_name: (Required) The name of the resource group.\n- subscription_id: (Optional) The id of the subscription. If not supplied the current subscription is used.\n- role_assignments: (Required) The role assignments to be applied to the scope.\n  - role_definition: (Required) The key of the role definition as defined in the role_definitions variable.\n  - users: (Optional) The keys of the users as defined in one of the users_by_... variables.\n  - groups: (Optional) The keys of the groups as defined in one of the groups_by_... variables.\n  - app_registrations: (Optional) The keys of the app registrations as defined in one of the app_registrations_by_... variables.\n  - system_assigned_managed_identities: (Optional) The keys of the system assigned managed identities as defined in one of the system_assigned_managed_identities_by_... variables.\n  - user_assigned_managed_identities: (Optional) The keys of the user assigned managed identities as defined in one of the user_assigned_managed_identities_by_... variables.\n  - any_principals: (Optional) The keys of the principals as defined in any of the [principal_type]_by_... variables. This is a convenience method that can be used in combination with or instrad of the specific principal type options.\n  - skip_service_principal_aad_check: (Optional) If set to true, the service principal AAD check is skipped. This is useful for role assignments where the Service Principal is newly created and not yet available in AAD. Defaults to false.\n\nExample Input:\n\nhcl\nrole_assignments_for_resource_groups = {\n  resource_group_name = \"my-resource-group-name\"\n  role_assignments    = {\n    role_definition = \"contributor\"\n    users = [\n      \"my-user-1\",\n      \"my-user-2\"\n    ]\n    groups = [\n      \"my-group-1\",\n      \"my-group-2\"\n    ]\n    app_registrations = [\n      \"my-app-1\",\n      \"my-app-2\"\n    ]\n    system_assigned_managed_identities = [\n      \"my-vm-1\",\n      \"my-vm-2\"\n    ]\n    user_assigned_managed_identities = [\n      \"my-user-assigned-managed-identity-1\",\n      \"my-user-assigned-managed-identity-2\"\n    ]\n  }\n}\n\n"
  type = map(object({
    resource_group_name = string
    subscription_id     = optional(string, null)
    role_assignments = map(object({
      role_definition                    = string
      users                              = optional(set(string), [])
      groups                             = optional(set(string), [])
      app_registrations                  = optional(set(string), [])
      system_assigned_managed_identities = optional(set(string), [])
      user_assigned_managed_identities   = optional(set(string), [])
      any_principals                     = optional(set(string), [])
      skip_service_principal_aad_check   = optional(bool, false)
    }))
  }))
  default = {}
}

variable "role_assignments_for_resources" {
  description = "(Optional) Role assignments to be applied to resources. The resource is defined by the resource name and the resource group name.\nThis variable only works with the current provider subscription. This is a convenience variable that avoids the need to find the resource id.\n\n- resouce_name: (Required) The names of the resource.\n- resource_group_name: (Required) The name of the resource group.\n- role_assignments: (Required) The role assignments to be applied to the scope.\n  - role_definition: (Required) The key of the role definition as defined in the role_definitions variable.\n  - users: (Optional) The keys of the users as defined in one of the users_by_... variables.\n  - groups: (Optional) The keys of the groups as defined in one of the groups_by_... variables.\n  - app_registrations: (Optional) The keys of the app registrations as defined in one of the app_registrations_by_... variables.\n  - system_assigned_managed_identities: (Optional) The keys of the system assigned managed identities as defined in one of the system_assigned_managed_identities_by_... variables.\n  - user_assigned_managed_identities: (Optional) The keys of the user assigned managed identities as defined in one of the user_assigned_managed_identities_by_... variables.\n  - any_principals: (Optional) The keys of the principals as defined in any of the [principal_type]_by_... variables. This is a convenience method that can be used in combination with or instrad of the specific principal type options.\n  - skip_service_principal_aad_check: (Optional) If set to true, the service principal AAD check is skipped. This is useful for role assignments where the Service Principal is newly created and not yet available in AAD. Defaults to false.\n\nExample Input:\n\nhcl\nrole_assignments_for_resources = {\n  resource_name       = \"my-resource-name\"\n  resource_group_name = \"my-resource-group-name\"\n  role_assignments    = {\n    role_definition = \"contributor\"\n    users = [\n      \"my-user-1\",\n      \"my-user-2\"\n    ]\n    groups = [\n      \"my-group-1\",\n      \"my-group-2\"\n    ]\n    app_registrations = [\n      \"my-app-1\",\n      \"my-app-2\"\n    ]\n    system_assigned_managed_identities = [\n      \"my-vm-1\",\n      \"my-vm-2\"\n    ]\n    user_assigned_managed_identities = [\n      \"my-user-assigned-managed-identity-1\",\n      \"my-user-assigned-managed-identity-2\"\n    ]\n  }\n}\n\n"
  type = map(object({
    resource_name       = string
    resource_group_name = string
    role_assignments = map(object({
      role_definition                    = string
      users                              = optional(set(string), [])
      groups                             = optional(set(string), [])
      app_registrations                  = optional(set(string), [])
      system_assigned_managed_identities = optional(set(string), [])
      user_assigned_managed_identities   = optional(set(string), [])
      any_principals                     = optional(set(string), [])
      skip_service_principal_aad_check   = optional(bool, false)
    }))
  }))
  default = {}
}

variable "role_assignments_for_scopes" {
  description = "(Optional) Role assignments to be applied to specific scope ids. The scope id is the id of the resource, resource group, subscription or management group.\n\n- scope: (Required) The scope / id of the resource, resource group, subscription or management group.\n- role_assignments: (Required) The role assignments to be applied to the scope.\n  - role_definition: (Required) The key of the role definition as defined in the role_definitions variable.\n  - users: (Optional) The keys of the users as defined in one of the users_by_... variables.\n  - groups: (Optional) The keys of the groups as defined in one of the groups_by_... variables.\n  - app_registrations: (Optional) The keys of the app registrations as defined in one of the app_registrations_by_... variables.\n  - system_assigned_managed_identities: (Optional) The keys of the system assigned managed identities as defined in one of the system_assigned_managed_identities_by_... variables.\n  - user_assigned_managed_identities: (Optional) The keys of the user assigned managed identities as defined in one of the user_assigned_managed_identities_by_... variables.\n  - any_principals: (Optional) The keys of the principals as defined in any of the [principal_type]_by_... variables. This is a convenience method that can be used in combination with or instrad of the specific principal type options.\n  - skip_service_principal_aad_check: (Optional) If set to true, the service principal AAD check is skipped. This is useful for role assignments where the Service Principal is newly created and not yet available in AAD. Defaults to false.\n\nExample Input:\n\nhcl\nrole_assignments_for_scopes = {\n  scope            = \"/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-resource-group\"\n  role_assignments = {\n    role_definition = \"contributor\"\n    users = [\n      \"my-user-1\",\n      \"my-user-2\"\n    ]\n    groups = [\n      \"my-group-1\",\n      \"my-group-2\"\n    ]\n    app_registrations = [\n      \"my-app-1\",\n      \"my-app-2\"\n    ]\n    system_assigned_managed_identities = [\n      \"my-vm-1\",\n      \"my-vm-2\"\n    ]\n    user_assigned_managed_identities = [\n      \"my-user-assigned-managed-identity-1\",\n      \"my-user-assigned-managed-identity-2\"\n    ]\n  }\n}\n\n"
  type = map(object({
    scope = string
    role_assignments = map(object({
      role_definition                    = string
      users                              = optional(set(string), [])
      groups                             = optional(set(string), [])
      app_registrations                  = optional(set(string), [])
      system_assigned_managed_identities = optional(set(string), [])
      user_assigned_managed_identities   = optional(set(string), [])
      any_principals                     = optional(set(string), [])
      skip_service_principal_aad_check   = optional(bool, false)
    }))
  }))
  default = {}
}

variable "role_assignments_for_subscriptions" {
  description = "(Optional) Role assignments to be applied to subscriptions.\nThis will default to the current subscription (default) or a subscription_id can be supplied to target another subscription.\nThis is a convenience variable that avoids the need to find the resource id of the subscription.\n\n- subscription_id: (Optional) The id of the subscription. If not supplied the current subscription is used.\n- role_assignments: (Required) The role assignments to be applied to the scope.\n  - role_definition: (Required) The key of the role definition as defined in the role_definitions variable.\n  - users: (Optional) The keys of the users as defined in one of the users_by_... variables.\n  - groups: (Optional) The keys of the groups as defined in one of the groups_by_... variables.\n  - app_registrations: (Optional) The keys of the app registrations as defined in one of the app_registrations_by_... variables.\n  - system_assigned_managed_identities: (Optional) The keys of the system assigned managed identities as defined in one of the system_assigned_managed_identities_by_... variables.\n  - user_assigned_managed_identities: (Optional) The keys of the user assigned managed identities as defined in one of the user_assigned_managed_identities_by_... variables.\n  - any_principals: (Optional) The keys of the principals as defined in any of the [principal_type]_by_... variables. This is a convenience method that can be used in combination with or instrad of the specific principal type options.\n  - skip_service_principal_aad_check: (Optional) If set to true, the service principal AAD check is skipped. This is useful for role assignments where the Service Principal is newly created and not yet available in AAD. Defaults to false.\n\nExample Input:\n\nhcl\nrole_assignments_for_subscriptions = {\n  subscription_id     = \"00000000-0000-0000-0000-000000000000\"\n  role_assignments    = {\n    role_definition = \"contributor\"\n    users = [\n      \"my-user-1\",\n      \"my-user-2\"\n    ]\n    groups = [\n      \"my-group-1\",\n      \"my-group-2\"\n    ]\n    app_registrations = [\n      \"my-app-1\",\n      \"my-app-2\"\n    ]\n    system_assigned_managed_identities = [\n      \"my-vm-1\",\n      \"my-vm-2\"\n    ]\n    user_assigned_managed_identities = [\n      \"my-user-assigned-managed-identity-1\",\n      \"my-user-assigned-managed-identity-2\"\n    ]\n  }\n}\n\n"
  type = map(object({
    subscription_id = optional(string, null)
    role_assignments = map(object({
      role_definition                    = string
      users                              = optional(set(string), [])
      groups                             = optional(set(string), [])
      app_registrations                  = optional(set(string), [])
      system_assigned_managed_identities = optional(set(string), [])
      user_assigned_managed_identities   = optional(set(string), [])
      any_principals                     = optional(set(string), [])
      skip_service_principal_aad_check   = optional(bool, false)
    }))
  }))
  default = {}
}

variable "role_definitions" {
  description = "(Optional) A map of Azure Resource Manager role definitions to reference in role assignments.\nThe key is something unique to you. The value is a built in or custom role definition name.\n\nExample Input:\n\nhcl\nrole_definitions = {\n  owner = {\n    name = \"Owner\"\n  }\n  contributor = {\n    name = \"Contributor\"\n  }\n  reader = {\n    name = \"Reader\"\n  }\n  custom_role_by_name = {\n    name  = \"Custom Role\"\n    scope = \"/subscriptions/00000000-0000-0000-0000-000000000000\"\n  }\n  custom_role_by_id = {\n    id = \"00000000-0000-0000-0000-000000000000\"\n  }\n}\n\n"
  type = map(object({
    id    = optional(string)
    name  = optional(string)
    scope = optional(string)
  }))
  default = {}
}

variable "skip_service_principal_aad_check" {
  description = "DEPRECATED: Please use the new skip_service_principal_aad_check variable inside of the different role_assignments blocks.\n\n(Optional) Skip the check for the service principal in Azure AD.\nThis is useful when the service principal is not yet created in Azure AD.\n"
  type        = bool
  default     = false
}

variable "system_assigned_managed_identities_by_client_id" {
  description = "(Optional) A map of system assigned managed identities to reference in role assignments.\nThe key is something unique to you. The value is the client id of the identity.\n\nExample Input:\n\nhcl\nsystem_assigned_managed_identities_by_client_id = {\n  my-vm-1 = \"00000000-0000-0000-0000-000000000001\"\n  my-vm-2 = \"00000000-0000-0000-0000-000000000002\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "system_assigned_managed_identities_by_display_name" {
  description = "(Optional) A map of system assigned managed identities to reference in role assignments.\nThe key is something unique to you. The value is the display name of the identity / compute instance.\n\nExample Input:\n\nhcl\nsystem_assigned_managed_identities_by_display_name = {\n  my-vm-1 = \"My VM 1\"\n  my-vm-2 = \"My VM 2\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "system_assigned_managed_identities_by_principal_id" {
  description = "(Optional) A map of system assigned managed identities to reference in role assignments.\nThe key is something unique to you. The value is the principal id of the underying service principalk of the identity.\n\nExample Input:\n\nhcl\nsystem_assigned_managed_identities_by_principal_id = {\n  my-vm-1 = \"00000000-0000-0000-0000-000000000001\"\n  my-vm-2 = \"00000000-0000-0000-0000-000000000002\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "user_assigned_managed_identities_by_client_id" {
  description = "(Optional) A map of system assigned managed identities to reference in role assignments.\nThe key is something unique to you. The value is the client id of the identity.\n\nExample Input:\n\nhcl\nuser_assigned_managed_identities_by_client_id = {\n  my-identity-1 = \"00000000-0000-0000-0000-000000000001\"\n  my-identity-2 = \"00000000-0000-0000-0000-000000000002\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "user_assigned_managed_identities_by_display_name" {
  description = "(Optional) A map of system assigned managed identities to reference in role assignments.\nThe key is something unique to you. The value is the display name of the identity.\n\nExample Input:\n\nhcl\nuser_assigned_managed_identities_by_display_name = {\n  my-identity-1 = \"My Identity 1\"\n  my-identity-2 = \"My Identity 2\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "user_assigned_managed_identities_by_principal_id" {
  description = "(Optional) A map of system assigned managed identities to reference in role assignments.\nThe key is something unique to you. The value is the principal id of the underying service principalk of the identity.\n\nExample Input:\n\nhcl\nuser_assigned_managed_identities_by_principal_id = {\n  my-identity-1 = \"00000000-0000-0000-0000-000000000001\"\n  my-identity-2 = \"00000000-0000-0000-0000-000000000002\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "user_assigned_managed_identities_by_resource_group_and_name" {
  description = "(Optional) A map of user assigned managed identities to reference in role assignments.\nThe key is something unique to you. The values are:\n\n- resource_group_name: The name of the resource group the identity is in.\n- name: The name of the identity.\n\nExample Input:\n\nhcl\nuser_assigned_managed_identities_by_resource_group_and_name = {\n  my-identity-1 = {\n    resource_group_name = \"my-rg-1\"\n    name                = \"my-identity-1\"\n  }\n  my-identity-2 = {\n    resource_group_name = \"my-rg-2\"\n    name                = \"my-identity-2\"\n  }\n}\n\n"
  type = map(object({
    resource_group_name = string
    name                = string
  }))
  default = {}
}

variable "users_by_employee_id" {
  description = "(Optional) A map of Entra ID users to reference in role assignments.\nThe key is something unique to you. The value is the employee ID of the user.\n\nExample Input:\n\nhcl\nusers_by_employee_id = {\n  my-user-1 = \"1234567890\"\n  my-user-2 = \"0987654321\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "users_by_mail" {
  description = "(Optional) A map of Entra ID users to reference in role assignments.\nThe key is something unique to you. The value is the mail address of the user.\n\nExample Input:\n\nhcl\nusers_by_mail = {\n  my-user-1 = \"user.1@example.com\"\n  my-user-2 = \"user.2@example.com\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "users_by_mail_nickname" {
  description = "(Optional) A map of Entra ID users to reference in role assignments.\nThe key is something unique to you. The value is the mail nickname of the user.\n\nExample Input:\n\nhcl\nusers_by_mail_nickname = {\n  my-user-1 = \"user1-nickname\"\n  my-user-2 = \"user2-nickname\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "users_by_object_id" {
  description = "(Optional) A map of Entra ID users to reference in role assignments.\nThe key is something unique to you. The value is the object ID of the user.\n\nExample Input:\n\nhcl\nusers_by_object_id = {\n  my-user-1 = \"00000000-0000-0000-0000-000000000001\"\n  my-user-2 = \"00000000-0000-0000-0000-000000000002\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "users_by_user_principal_name" {
  description = "(Optional) A map of Entra ID users to reference in role assignments.\nThe key is something unique to you. The value is the user principal name (UPN) of the user.\n\nExample Input:\n\nhcl\nusers_by_user_principal_name = {\n  my-user-1 = \"user1@example.com\"\n  my-user-2 = \"user2@example.com\"\n}\n\n"
  type        = map(string)
  default     = {}
}
