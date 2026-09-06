variable "base_archetype" {
  description = "The archetype of the management group.\nThis should be one of the built in archetypes, or a custom one defined in one of the lib_dirs.\n"
  type        = string
  default     = ""
}

variable "default_location" {
  description = "The default location for resources in this management group. Used for policy managed identities.\n"
  type        = string
  default     = ""
}

variable "default_log_analytics_workspace_id" {
  description = "The resource id of the default log analytics workspace to use for policy parameters.\n"
  type        = string
  default     = null
}

variable "default_private_dns_zone_resource_group_id" {
  description = "Resource group id for the private dns zones to use in policy parameters.\n"
  type        = string
  default     = null
}

variable "delays" {
  description = "A map of delays to apply to the creation and destruction of resources.\nIncluded to work around some race conditions in Azure.\n"
  type = object({
    before_management_group = optional(object({
      create  = optional(string, "30s")
      destroy = optional(string, "0s")
    }), {})
    before_policy_assignments = optional(object({
      create  = optional(string, "30s")
      destroy = optional(string, "0s")
    }), {})
    before_policy_role_assignments = optional(object({
      create  = optional(string, "60s")
      destroy = optional(string, "0s")
    }), {})
  })
  default = {}
}

variable "display_name" {
  description = "The display name of the management group.\n"
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "id" {
  description = "The id of the management group. This must be unique and cannot be changed after creation.\n"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The id of the parent management group. Use the tenant id to create a child of the tenant root group.\nThe azurerm_client_config data source from the AzureRM provider is useful to get the tenant id.\n"
  type        = string
  default     = ""
}

variable "policy_assignments_to_modify" {
  description = "A map of policy assignment objects to modify the ALZ archetype with.\nYou only need to specify the properties you want to change.\n\nThe key is the name of the policy assignment.\nThe value is a map of the properties of the policy assignment.\n\n- enforcement_mode - (Optional) The enforcement mode of the policy assignment. Possible values are Default and DoNotEnforce.\n- identity - (Optional) The identity of the policy assignment. Possible values are SystemAssigned and UserAssigned.\n- identity_ids - (Optional) A set of ids of the user assigned identities to assign to the policy assignment.\n- non_compliance_message - (Optional) A set of non compliance message objects to use for the policy assignment. Each object has the following properties:\n  - message - (Required) The non compliance message.\n  - policy_definition_reference_id - (Optional) The reference id of the policy definition to use for the non compliance message.\n- parameters - (Optional) A JSON string of parameters to use for the policy assignment. E.g. jsonencode({\"param1\": \"value1\", \"param2\": 2}).\n- resource_selectors - (Optional) A list of resource selector objects to use for the policy assignment. Each object has the following properties:\n  - name - (Required) The name of the resource selector.\n  - selectors - (Optional) A list of selector objects to use for the resource selector. Each object has the following properties:\n    - kind - (Required) The kind of the selector. Allowed values are: resourceLocation, resourceType, resourceWithoutLocation. resourceWithoutLocation cannot be used in the same resource selector as resourceLocation.\n    - in - (Optional) A set of strings to include in the selector.\n    - not_in - (Optional) A set of strings to exclude from the selector.\n- overrides - (Optional) A list of override objects to use for the policy assignment. Each object has the following properties:\n  - kind - (Required) The kind of the override.\n  - value - (Required) The value of the override. Supported values are policy effects: <https://learn.microsoft.com/azure/governance/policy/concepts/effects>.\n  - selectors - (Optional) A list of selector objects to use for the override. Each object has the following properties:\n    - kind - (Required) The kind of the selector.\n    - in - (Optional) A set of strings to include in the selector.\n    - not_in - (Optional) A set of strings to exclude from the selector.\n"
  type = map(object({
    enforcement_mode = optional(string, null)
    identity         = optional(string, null)
    identity_ids     = optional(list(string), null)
    parameters       = optional(string, null)
    non_compliance_message = optional(set(object({
      message                        = string
      policy_definition_reference_id = optional(string, null)
    })), null)
    resource_selectors = optional(list(object({
      name = string
      selectors = optional(list(object({
        kind   = string
        in     = optional(set(string), null)
        not_in = optional(set(string), null)
      })), [])
    })))
    overrides = optional(list(object({
      kind  = string
      value = string
      selectors = optional(list(object({
        kind   = string
        in     = optional(set(string), null)
        not_in = optional(set(string), null)
      })), [])
    })))
  }))
  default = {}
}

variable "role_assignments" {
  description = "A map of role assignments to associated principals and role definitions to the management group.\n\nThe key is the your reference for the role assignment. The value is a map of the properties of the role assignment.\n\n- role_definition_id - (Optional) The id of the role definition to assign to the principal. Conflicts with role_definition_name. role_definition_id and role_definition_name are mutually exclusive and one of them must be supplied.\n- role_definition_name - (Optional) The name of the role definition to assign to the principal. Conflicts with role_definition_id.\n- principal_id - (Required) The id of the principal to assign the role definition to.\n- description - (Optional) The description of the role assignment.\n\n"
  type = map(object({
    role_definition_id   = optional(string, "")
    role_definition_name = optional(string, "")
    principal_id         = string
    description          = optional(string, null)
  }))
  default = {}
}

variable "subscription_ids" {
  description = "A set of subscription ids to move under this management group.\n"
  type        = set(string)
  default     = []
}

variable "telemetry_resource_group_name" {
  description = "The resource group where the telemetry will be deployed."
  type        = string
  default     = ""
}
