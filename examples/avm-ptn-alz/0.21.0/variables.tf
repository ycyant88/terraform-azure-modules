variable "architecture_name" {
  description = "The name of the architecture to create. This needs to be of the *.alz_architecture_definition.[json|yaml|yml] files.\n"
  type        = string
  default     = ""
}

variable "delays" {
  description = "DEPRECATED: Please use the new retries variable instead to allow the provider to retry on certain errors.\n\nA map of delays to apply to the creation and destruction of resources.\nIncluded to work around some race conditions in Azure.\n"
  type = object({
    after_management_group = optional(object({
      create  = optional(string, "0s")
      destroy = optional(string, "0s")
    }), {})
    after_policy_definitions = optional(object({
      create  = optional(string, "0s")
      destroy = optional(string, "0s")
    }), {})
    after_policy_set_definitions = optional(object({
      create  = optional(string, "0s")
      destroy = optional(string, "0s")
    }), {})
  })
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The default location for resources in this management group. Used for policy managed identities.\n"
  type        = string
  default     = ""
}

variable "management_group_hierarchy_settings" {
  description = "Set this value to configure the hierarchy settings. Options are:\n\n- default_management_group_name - (Required) The name of the default management group.\n- require_authorization_for_group_creation - (Optional) By default, all Entra security principals can create new management groups. When enabled, security principals must have management group write access to create new management groups. Defaults to true.\n- update_existing - (Optional) Update existing hierarchy settings rather than create new. Defaults to false.\n"
  type = object({
    default_management_group_name            = string
    require_authorization_for_group_creation = optional(bool, true)
    update_existing                          = optional(bool, false)
  })
  default = null
}

variable "management_group_role_assignments" {
  description = "  A map of role assignments to create. The map key is deliberately arbitrary to avoid issues where map keys might be unknown at plan time.\n\n  - management_group_name - The name of the management group to assign the role to.\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) No effect when using AzAPI.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\nWe recommend using role assignment conditions to restrict privileged assignments. A sensible default is to use the condition attribute to restrict the roles that can be assigned. The following example will restrict the role assignment to prevent the Owner, Role Based Access Control Administrator, and User Access Administrator roles being assigned:\n\ntext\n\"((!(ActionMatches{'Microsoft.Authorization/roleAssignments/write'}))OR(@Request[Microsoft.Authorization/roleAssignments:RoleDefinitionId]ForAnyOfAllValues:GuidNotEquals{8e3af657-a8ff-443c-a75c-2fe8c4bcb635, 18d7d88d-d35e-4fb5-a5c3-7773c20a72d9, f58310d9-a9f6-439a-9e8d-f62e7b41a168}))AND((!(ActionMatches{'Microsoft.Authorization/roleAssignments/delete'}))OR(@Resource[Microsoft.Authorization/roleAssignments:RoleDefinitionId]ForAnyOfAllValues:GuidNotEquals{8e3af657-a8ff-443c-a75c-2fe8c4bcb635, 18d7d88d-d35e-4fb5-a5c3-7773c20a72d9, f58310d9-a9f6-439a-9e8d-f62e7b41a168}))\"\n\n"
  type = map(object({
    management_group_name                  = string
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default = {}
}

variable "management_groups_dependencies" {
  description = "Place dependent values into this variable to ensure that management groups are created in the correct order.\nEnsure that the values placed here are computed/known after apply, e.g. the resource ids.\n\nThis is necessary as the unknown values and depends_on are not supported by this module as we use the alz provider.\nSee the \"Unknown Values & Depends On\" section above for more information.\n\ne.g.\nhcl\nmanagement_group_dependencies = [\n  module.dependency_example1.output,\n  module.dependency_example2.output,\n]\n"
  type        = any
  default     = null
}

variable "override_policy_definition_parameter_assign_permissions_set" {
  description = "This list of objects allows you to set the [assignPermissions metadata property](https://learn.microsoft.com/azure/governance/policy/concepts/definition-structure-parameters#parameter-properties) of the supplied definition and parameter names.\nThis allows you to correct policies that haven't been authored correctly and means that the provider can generate the correct policy role assignments.\n\nThe value is a list of objects with the following attributes:\n\n- definition_name - (Required) The name of the policy definition, ***for built-in policies this us a UUID***.\n- parameter_name - (Required) The name of the parameter to set the assignPermissions property for.\n\nThe default value has been populated with the Azure Landing Zones policies that are assigned by default, but do not have the correct parameter metadata.\n"
  type = set(object({
    definition_name = string
    parameter_name  = string
  }))
  default = [{ "definition_name" : "04754ef9-9ae3-4477-bf17-86ef50026304", "parameter_name" : "userWorkspaceResourceId" }, { "definition_name" : "09963c90-6ee7-4215-8d26-1cc660a1682f", "parameter_name" : "userAssignedIdentityResourceId" }, { "definition_name" : "09a1f130-7697-42bc-8d84-8a9ea17e5192", "parameter_name" : "dcrResourceId" }, { "definition_name" : "0b026355-49cb-467b-8ac4-f777874e175a", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "1142b015-2bd7-41e0-8645-a531afe09a1e", "parameter_name" : "dcrResourceId" }, { "definition_name" : "1e5ed725-f16c-478b-bd4b-7bfa2f7940b9", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "2227e1f1-23dd-4c3a-85a9-7024a401d8b2", "parameter_name" : "dcrResourceId" }, { "definition_name" : "34804460-d88b-4922-a7ca-537165e060e", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "4485d24b-a9d3-4206-b691-1fad83bc5007", "parameter_name" : "userAssignedIdentityResourceId" }, { "definition_name" : "4ec38ebc-381f-45ee-81a4-acbc4be878f8", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "516187d4-ef64-4a1b-ad6b-a7348502976c", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "56d0ed2b-60fc-44bf-af81-a78c851b5fe1", "parameter_name" : "userAssignedIdentityResourceId" }, { "definition_name" : "59c3d93f-900b-4827-a8bd-562e7b956e7c", "parameter_name" : "userAssignedIdentityResourceId" }, { "definition_name" : "637125fd-7c39-4b94-bb0a-d331faf333a9", "parameter_name" : "userAssignedIdentityResourceId" }, { "definition_name" : "63d03cbd-47fd-4ee1-8a1c-9ddf07303de0", "parameter_name" : "userWorkspaceResourceId" }, { "definition_name" : "6a4e6f44-f2af-4082-9702-033c9e88b9f8", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "6dd01e4f-1be1-4e80-9d0b-d109e04cb064", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "7590a335-57cf-4c95-babd-ecbc8fafeb1f", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "7a860e27-9ca2-4fc6-822d-c2d248c300df", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "86cd96e1-1745-420d-94d4-d3f2fe415aa4", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "8fd85785-1547-4a4a-bf90-d5483c9571c5", "parameter_name" : "dcrResourceId" }, { "definition_name" : "9427df23-0f42-4e1e-bf99-a6133d841c4a", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "942bd215-1a66-44be-af65-6a1c0318dbe2", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "98569e20-8f32-4f31-bf34-0e91590ae9d3", "parameter_name" : "userAssignedIdentityResourceId" }, { "definition_name" : "a63cc0bd-cda4-4178-b705-37dc439d3e0f", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "aaa64d2d-2fa3-45e5-b332-0b031b9b30e8", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "ad1eeff9-20d7-4c82-a04e-903acab0bfc1", "parameter_name" : "userAssignedIdentityResourceId" }, { "definition_name" : "ae8a10e6-19d6-44a3-a02d-a2bdfc707742", "parameter_name" : "userAssignedIdentityResourceId" }, { "definition_name" : "b0e86710-7fb7-4a6c-a064-32e9b829509e", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "b318f84a-b872-429b-ac6d-a01b96814452", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "b6faa975-0add-4f35-8d1c-70bba45c4424", "parameter_name" : "dcrResourceId" }, { "definition_name" : "b73e81f3-6303-48ad-9822-b69fc00c15ef", "parameter_name" : "userAssignedIdentityResourceId" }, { "definition_name" : "baf19753-7502-405f-8745-370519b20483", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "c99ce9c1-ced7-4c3e-aca0-10e69ce0cb02", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "d367bd60-64ca-4364-98ea-276775bddd94", "parameter_name" : "userAssignedIdentityResourceId" }, { "definition_name" : "d389df0a-e0d7-4607-833c-75a6fdac2c2d", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "d627d7c6-ded5-481a-8f2e-7e16b1e6faf6", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "ddca0ddc-4e9d-4bbb-92a1-f7c4dd7ef7ce", "parameter_name" : "dcrResourceId" }, { "definition_name" : "e016b22b-e0eb-436d-8fd7-160c4eaed6e2", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "ed66d4f5-8220-45dc-ab4a-20d1749c74e6", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "ee40564d-486e-4f68-a5ca-7a621edae0fb", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "ee40564d-486e-4f68-a5ca-7a621edae0fb", "parameter_name" : "secondPrivateDnsZoneId" }, { "definition_name" : "ef9fe2ce-a588-4edd-829c-6247069dcfdb", "parameter_name" : "dcrResourceId" }, { "definition_name" : "f0fcf93c-c063-4071-9668-c47474bd3564", "parameter_name" : "privateDnsZoneId" }, { "definition_name" : "f91991d1-5383-4c95-8ee5-5ac423dd8bb1", "parameter_name" : "userAssignedIdentityResourceId" }, { "definition_name" : "fbc14a67-53e4-4932-abcc-2049c6706009", "parameter_name" : "privateDnsZoneId" }]
}

variable "override_policy_definition_parameter_assign_permissions_unset" {
  description = "This list of objects allows you to unset the [assignPermissions metadata property](https://learn.microsoft.com/azure/governance/policy/concepts/definition-structure-parameters#parameter-properties) of the supplied definition and parameter names.\nThis allows you to correct policies that haven't been authored correctly, or prevent permissions being assigned for policies that are disabled in a policy set. The provider can then generate the correct policy role assignments.\n\nThe value is a list of objects with the following attributes:\n\n- definition_name - (Required) The name of the policy definition, ***for built-in policies this us a UUID***.\n- parameter_name - (Required) The name of the parameter to unset the assignPermissions property for.\n"
  type = set(object({
    definition_name = string
    parameter_name  = string
  }))
  default = null
}

variable "parent_id_overrides" {
  description = "A map of parent_id overrides for resources that have inconsistent casing in Azure.\nThis allows you to override the parent_id path for specific resources to avoid forced replacement due to casing differences.\n\nThe object has the following optional attributes:\n\n- policy_assignments - (Optional) A map of policy assignment keys to parent_id path overrides. The key should be in the format management_group_id/assignment_name. The value should be the parent_id path prefix (e.g., /providers/Microsoft.Management/managementgroups instead of /providers/Microsoft.Management/managementGroups).\n- policy_definitions - (Optional) A map of policy definition keys to parent_id path overrides. The key should be in the format management_group_id/definition_name. The value should be the parent_id path prefix.\n- policy_set_definitions - (Optional) A map of policy set definition keys to parent_id path overrides. The key should be in the format management_group_id/set_definition_name. The value should be the parent_id path prefix.\n- role_definitions - (Optional) A map of role definition keys to parent_id path overrides. The key should be in the format management_group_id/role_definition_name. The value should be the parent_id path prefix.\n\nExample:\n\nhcl\nmodule \"alz\" {\n  source = \"Azure/terraform-azurerm-avm-ptn-alz/azurerm\"\n\n  # the key format is management group id/policy assignment name\n  parent_id_overrides = {\n    policy_definitions = {\n      \"alz/Deny-Classic-Resources\" = \"/providers/Microsoft.Management/managementgroups\"\n    }\n  }\n}\n\n"
  type = object({
    policy_assignments     = optional(map(string), {})
    policy_definitions     = optional(map(string), {})
    policy_set_definitions = optional(map(string), {})
    role_definitions       = optional(map(string), {})
  })
  default = {}
}

variable "parent_resource_id" {
  description = "The resource name of the parent management group. Use the tenant id to create a child of the tenant root group.\nThe azurerm_client_config/azapi_client_config data sources are able to retrieve the tenant id.\nDo not include the /providers/Microsoft.Management/managementGroups/ prefix.\n"
  type        = string
  default     = ""
}

variable "policy_assignment_non_compliance_message_settings" {
  description = "Settings for the default non-compliance messages applied to policy assignments by the alz provider.\n\nThe object has the following attributes:\n\n- default_message - (Optional) The default non-compliance message to apply to policy assignments. Supports placeholder substitution configured in the provider's non_compliance_message_substitution_settings block. Defaults to null, which disables the default non-compliance message behavior in the provider for backwards compatibility.\n- merge_mode - (Optional) Controls behavior when a policy assignment already has a default non-compliance message (one without a policyDefinitionReferenceId).\n  - replace (default) removes the existing default message and adds the configured default.\n  - prefer_existing keeps the existing default message if present, only adding the configured default when none exists.\n  Policy-specific messages (with policyDefinitionReferenceId) are always preserved. Assignments with no messages always receive the default if a default message is supplied.\n\n  If you wish to amend the placeholder values in the default message, you can use the non_compliance_message_substitution_settings block in the provider to configure this.\n"
  type = object({
    default_message = optional(string, "This resource {enforcementMode} be compliant with the assigned policy")
    merge_mode      = optional(string, "replace")
  })
  default = {}
}

variable "policy_assignments_dependencies" {
  description = "Place dependent values into this variable to ensure that policy assignments are created in the correct order.\nEnsure that the values placed here are computed/known after apply, e.g. the resource ids.\n\nThis is necessary as the unknown values and depends_on are not supported by this module as we use the alz provider.\nSee the \"Unknown Values & Depends On\" section above for more information.\n\ne.g.\nhcl\npolicy_assignments_dependencies = [\n  module.dependency_example1.output,\n  module.dependency_example2.output,\n]\n"
  type        = any
  default     = null
}

variable "policy_assignments_to_modify" {
  description = "A map of policy assignment objects to modify the ALZ architecture with.\nYou only need to specify the properties you want to change.\n\nThe key is the id of the management group. The value is an object with a single attribute, policy_assignments.\nThe policy_assignments value is a map of policy assignments to modify.\nThe key of this map is the assignment name, and the value is an object with optional attributes for modifying the policy assignments.\n\n- enforcement_mode - (Optional) The enforcement mode of the policy assignment. Possible values are Default and DoNotEnforce.\n- identity - (Optional) The identity of the policy assignment. Possible values are SystemAssigned and UserAssigned.\n- identity_ids - (Optional) A set of ids of the user assigned identities to assign to the policy assignment.\n- non_compliance_message - (Optional) A set of non compliance message objects to use for the policy assignment. Each object has the following properties:\n  - message - (Required) The non compliance message.\n  - policy_definition_reference_id - (Optional) The reference id of the policy definition to use for the non compliance message.\n- parameters - (Optional) The parameters to use for the policy assignment. The map key is the parameter name and the value is an JSON object containing a single Value attribute with the values to apply. This to mitigate issues with the Terraform type system. E.g. { defaultName = jsonencode({Value = \\\"value\\\"}) }.\n- resource_selectors - (Optional) A list of resource selector objects to use for the policy assignment. Each object has the following properties:\n  - name - (Required) The name of the resource selector.\n  - selectors - (Optional) A list of selector objects to use for the resource selector. Each object has the following properties:\n    - kind - (Required) The kind of the selector. Allowed values are: resourceLocation, resourceType, resourceWithoutLocation. resourceWithoutLocation cannot be used in the same resource selector as resourceLocation.\n    - in - (Optional) A set of strings to include in the selector.\n    - not_in - (Optional) A set of strings to exclude from the selector.\n- overrides - (Optional) A list of override objects to use for the policy assignment. Each object has the following properties:\n  - kind - (Required) The kind of the override.\n  - value - (Required) The value of the override. Supported values are policy effects: <https://learn.microsoft.com/azure/governance/policy/concepts/effects>.\n  - selectors - (Optional) A list of selector objects to use for the override. Each object has the following properties:\n    - kind - (Required) The kind of the selector.\n    - in - (Optional) A set of strings to include in the selector.\n    - not_in - (Optional) A set of strings to exclude from the selector.\n- creation_enabled - (Optional) Whether the policy assignment is created or not. Defaults to true. IMPORTANT: This is a convenience property for very small scale deployments, the recommended approach is to update your custom library to exclude the policy assignment.\n\n"
  type = map(object({
    policy_assignments = map(object({
      enforcement_mode = optional(string, null)
      identity         = optional(string, null)
      identity_ids     = optional(list(string), null)
      parameters       = optional(map(string), null)
      not_scopes       = optional(list(string), null)
      non_compliance_messages = optional(set(object({
        message                        = string
        policy_definition_reference_id = optional(string, null)
      })), null)
      resource_selectors = optional(list(object({
        name = string
        resource_selector_selectors = optional(list(object({
          kind   = string
          in     = optional(set(string), null)
          not_in = optional(set(string), null)
        })), [])
      })))
      overrides = optional(list(object({
        kind  = string
        value = string
        override_selectors = optional(list(object({
          kind   = string
          in     = optional(set(string), null)
          not_in = optional(set(string), null)
        })), [])
      })))
      creation_enabled = optional(bool, true)
    }))
  }))
  default = {}
}

variable "policy_default_values" {
  description = "A map of default values to apply to policy assignments. The key is the default name as defined in the library, and the value is an JSON object containing a single value attribute with the values to apply. This to mitigate issues with the Terraform type system. E.g. { defaultName = jsonencode({ value = \\\"value\\\"}) }\n"
  type        = map(string)
  default     = null
}

variable "policy_role_assignments_dependencies" {
  description = "Place dependent values into this variable to ensure that policy role assignments are created in the correct order.\nEnsure that the values placed here are computed/known after apply, e.g. the resource ids.\n\nThis is necessary as the unknown values and depends_on are not supported by this module as we use the alz provider.\nSee the \"Unknown Values & Depends On\" section above for more information.\n\ne.g.\nhcl\npolicy_role_assignments_dependencies = [\n  module.dependency_example1.output,\n  module.dependency_example2.output,\n]\n"
  type        = any
  default     = null
}

variable "resource_types" {
  description = "A map of full AzAPI resource type strings (<provider>/<resource>@<api-version>) used by this module.\n\nOverride an entry to change the casing or API version of the corresponding resource type. This is useful for sovereign clouds that need different API versions (e.g. US Government), or to work around AzAPI casing inconsistencies between create and read responses (for example, providing Microsoft.Authorization/RoleDefinitions@2022-04-01 to mitigate inconsistent-result errors from the upstream provider).\n\nModifying these values may produce unexpected behavior or compatibility issues which we cannot test for. Please do not raise issues against this module if you change these values.\n\nKeys:\n\n- management_group - Defaults to Microsoft.Management/managementGroups@2023-04-01.\n- management_group_settings - Defaults to Microsoft.Management/managementGroups/settings@2023-04-01.\n- management_group_subscription - Defaults to Microsoft.Management/managementGroups/subscriptions@2023-04-01.\n- policy_assignment - Defaults to Microsoft.Authorization/policyAssignments@2024-04-01.\n- policy_definition - Defaults to Microsoft.Authorization/policyDefinitions@2023-04-01.\n- policy_set_definition - Defaults to Microsoft.Authorization/policySetDefinitions@2023-04-01.\n- role_assignment - Defaults to Microsoft.Authorization/roleAssignments@2022-04-01.\n- role_definition - Defaults to Microsoft.Authorization/roleDefinitions@2022-04-01.\n- user_assigned_identity - Defaults to Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31.\n"
  type = object({
    management_group              = optional(string, "Microsoft.Management/managementGroups@2023-04-01")
    management_group_settings     = optional(string, "Microsoft.Management/managementGroups/settings@2023-04-01")
    management_group_subscription = optional(string, "Microsoft.Management/managementGroups/subscriptions@2023-04-01")
    policy_assignment             = optional(string, "Microsoft.Authorization/policyAssignments@2024-04-01")
    policy_definition             = optional(string, "Microsoft.Authorization/policyDefinitions@2023-04-01")
    policy_set_definition         = optional(string, "Microsoft.Authorization/policySetDefinitions@2023-04-01")
    role_assignment               = optional(string, "Microsoft.Authorization/roleAssignments@2022-04-01")
    role_definition               = optional(string, "Microsoft.Authorization/roleDefinitions@2022-04-01")
    user_assigned_identity        = optional(string, "Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31")
  })
  default = {}
}

variable "retries" {
  description = "The retry settings to apply to the CRUD operations. Value is a nested object, the top level keys are the resources and the values are an object with the following attributes:\n\n- error_message_regex - (Optional) A list of error message regexes to retry on. Defaults to null, which will will disable retries. Specify a value to enable.\n- interval_seconds - (Optional) The initial interval in seconds between retries. Defaults to null and will fall back to the provider default value.\n- max_interval_seconds - (Optional) The maximum interval in seconds between retries. Defaults to null and will fall back to the provider default value.\n- multiplier - (Optional) DEPRECATED The multiplier to apply to the interval between retries. Defaults to null and will fall back to the provider default value. This value is deprecated and will be removed in a future version.\n- randomization_factor - DEPRECATED (Optional) The randomization factor to apply to the interval between retries. Defaults to null and will fall back to the provider default value. This value is deprecated and will be removed in a future version.\n\nFor more information please see the provider documentation here: <https://registry.terraform.io/providers/Azure/azapi/azurerm/latest/docs/resources/resource#nestedatt--retry>\n"
  type = object({
    management_groups = optional(object({
      error_message_regex = optional(list(string), [
        "AuthorizationFailed", # Avoids a eventual consistency issue where a recently created management group is not yet available for a GET operation.
        "Permission to Microsoft.Management/managementGroups on resources of type 'Write' is required on the management group or its ancestors."
      ])
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    role_definitions = optional(object({
      error_message_regex = optional(list(string), [
        "AuthorizationFailed" # Avoids a eventual consistency issue where a recently created management group is not yet available for a GET operation.
      ])
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    role_assignments = optional(object({
      error_message_regex = optional(list(string), [
        "AuthorizationFailed", # Avoids a eventual consistency issue where a recently created management group is not yet available for a GET operation.
      ])
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    policy_definitions = optional(object({
      error_message_regex = optional(list(string), [
        "AuthorizationFailed" # Avoids a eventual consistency issue where a recently created management group is not yet available for a GET operation.
      ])
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    policy_set_definitions = optional(object({
      error_message_regex = optional(list(string), [
        "AuthorizationFailed" # Avoids a eventual consistency issue where a recently created management group is not yet available for a GET operation.
      ])
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    policy_assignments = optional(object({
      error_message_regex = optional(list(string), [
        "AuthorizationFailed",                                                      # Avoids a eventual consistency issue where a recently created management group is not yet available for a GET operation.
        "The policy definition specified in policy assignment '.+' is out of scope" # If assignment is created soon after a policy definition has been created then the assignment will fail with this error.
      ])
      interval_seconds     = optional(number, 5)
      max_interval_seconds = optional(number, 30)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    policy_role_assignments = optional(object({
      error_message_regex = optional(list(string), [
        "AuthorizationFailed",    # Avoids a eventual consistency issue where a recently created management group is not yet available for a GET operation.
        "ResourceNotFound",       # If the resource has just been created, retry until it is available.
        "RoleAssignmentNotFound", # If the resource has just been created, retry until it is available.
      ])
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    hierarchy_settings = optional(object({
      error_message_regex = optional(list(string), [
        "AuthorizationFailed", # Avoids a eventual consistency issue where a recently created management group is not yet available for a GET operation.
      ])
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    subscription_placement = optional(object({
      error_message_regex = optional(list(string), [
        "AuthorizationFailed", # Avoids a eventual consistency issue where a recently created management group is not yet available for a GET operation.
      ])
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
  })
  default = {}
}

variable "role_assignment_definition_lookup_enabled" {
  description = "A control to disable the lookup of role definitions when creating role assignments.\nIf you disable this then all role assignments must be supplied with a role_definition_id_or_name that is a valid role definition ID.\n"
  type        = bool
  default     = true
}

variable "role_assignment_name_use_random_uuid" {
  description = "A control to use a random UUID for the role assignment name.\nIf set to false, the name will be a deterministic UUID based on the principal ID and role definition resource ID,\nthough this can cause issues with duplicate UUIDs as the scope of the role assignment is not taken into account.\n\nThis is default to false to preserve existing behaviour.\nHowever, we recommend this is set to true to avoid resources becoming re-created due to computed attribute changes in the resource graph.\n"
  type        = bool
  default     = false
}

variable "schema_validation_enabled" {
  description = "Enable or disable schema validation for each resource type. Defaults to true for all resource types.\nIf you encounter issues with schema validation, please raise an issue against the AzAPI provider.\n"
  type = object({
    hierarchy_settings     = optional(bool, true)
    management_groups      = optional(bool, true)
    policy_assignments     = optional(bool, true)
    policy_definitions     = optional(bool, true)
    policy_set_definitions = optional(bool, true)
    role_assignments       = optional(bool, true)
    role_definitions       = optional(bool, true)
  })
  default = {}
}

variable "subscription_placement" {
  description = "A map of subscriptions to place into management groups. The key is deliberately arbitrary to avoid issues with known after apply values. The value is an object:\n\n- subscription_id - (Required) The id of the subscription to place in the management group.\n- management_group_name - (Required) The name of the management group to place the subscription in.\n"
  type = map(object({
    subscription_id       = string
    management_group_name = string
  }))
  default = {}
}

variable "subscription_placement_destroy_behavior" {
  description = "The behavior to apply when destroying a subscription placement. Possible values are:\n- parent - Move the subscription to the parent management group.\n- intermediate_root - Move the subscription to the intermediate root management group. The intermediate root management group must be pre-existing to use this option. Will fallback to default if there is no pre-existing intermediate root management group.\n- custom - Move the subscription to a custom management group specified by the subscription_placement_destroy_target_management_group_id variable.\n- default - Move the subscription to the default management group as specified in your Azure tenant\n"
  type        = string
  default     = "default"
}

variable "subscription_placement_destroy_custom_target_management_group_id" {
  description = "The target management group name to move subscriptions to when the subscription_placement_destroy_behavior variable is set to custom.\nDo not include the /providers/Microsoft.Management/managementGroups/ prefix.\n"
  type        = string
  default     = null
}

variable "telemetry_additional_content" {
  description = "Additional content to add to the telemetry tags. This can be used to add custom tags to the telemetry data.\nTo add array / object values, serialize them as JSON strings using jsonencode().\n\nAny information entered here will be sent to Microsoft as part of the telemetry data collected. Do not include any personal or sensitive information.\n\ne.g.\n\nhcl\ntelemetry_additional_content = {\n  custom_tag_1 = \"value1\"\n  custom_tag_2 = \"value2\"\n  custom_array_tag = jsonencode([\"value1\", \"value2\"])\n}\n"
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "A map of timeouts to apply to the creation and destruction of resources.\nIf using retry, the maximum elapsed retry time is governed by this value.\n\nThe object has attributes for each resource type, with the following optional attributes:\n\n- create - (Optional) The timeout for creating the resource. Defaults to 15m apart from policy assignments, where this is set to 20m.\n- delete - (Optional) The timeout for deleting the resource. Defaults to 5m.\n- update - (Optional) The timeout for updating the resource. Defaults to 5m.\n- read - (Optional) The timeout for reading the resource. Defaults to 5m.\n\nEach time duration is parsed using this function: <https://pkg.go.dev/time#ParseDuration>.\n"
  type = object({
    management_group = optional(object({
      create = optional(string, "60m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "60m")
      }), {}
    )
    role_definition = optional(object({
      create = optional(string, "60m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "60m")
      }), {}
    )
    role_assignment = optional(object({
      create = optional(string, "60m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "60m")
      }), {}
    )
    policy_definition = optional(object({
      create = optional(string, "60m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "60m")
      }), {}
    )
    policy_set_definition = optional(object({
      create = optional(string, "60m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "60m")
      }), {}
    )
    policy_assignment = optional(object({
      create = optional(string, "20m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "5m")
      }), {}
    )
    policy_role_assignment = optional(object({
      create = optional(string, "60m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "60m")
      }), {}
    )
  })
  default = {}
}
