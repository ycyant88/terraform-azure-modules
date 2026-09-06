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
  description = ""
  type        = string
  default     = null
}

variable "default_private_dns_zone_resource_group_id" {
  description = ""
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

variable "policy_assignments_to_add" {
  description = "A map of policy assignment objects to add or update the alz archetype with.\n\nThe key is the name of the policy assignment.\nThe value is a map of the properties of the policy assignment.\n\n- display_name - (Optional) The display name of the policy assignment.\n- enforcement_mode - (Optional) The enforcement mode of the policy assignment. Possible values are Default and DoNotEnforce.\n- identity - (Optional) The identity of the policy assignment. Possible values are SystemAssigned and UserAssigned.\n- identity_ids - (Optional) A set of ids of the user assigned identities to assign to the policy assignment.\n- non_compliance_message - (Optional) A set of non compliance message objects to use for the policy assignment. Each object has the following properties:\n  - message - (Required) The non compliance message.\n  - policy_definition_reference_id - (Optional) The reference id of the policy definition to use for the non compliance message.\n- parameters - (Optional) A JSON string of parameters to use for the policy assignment. Use jsonencode() to convert a map of the parameter names to values.\n- policy_definition_id - (Optional) The id of the policy definition to assign to the policy assignment. Conflicts with policy_definition_name and policy_set_definition_name.\n- policy_definition_name - (Optional) The name of the policy definition to assign to the policy assignment. Conflicts with policy_definition_id and policy_set_definition_name.\n- policy_set_definition_name - (Optional) The name of the policy set definition to assign to the policy assignment. Conflicts with policy_definition_id and policy_definition_name.\n"
  type = map(object({
    display_name               = optional(string, null)
    enforcement_mode           = optional(string, null)
    identity                   = optional(string, null)
    identity_ids               = optional(list(string), null)
    policy_definition_id       = optional(string, null)
    policy_definition_name     = optional(string, null)
    policy_set_definition_name = optional(string, null)
    parameters                 = optional(string, null)
  }))
  default = {}
}

variable "policy_assignments_to_remove" {
  description = "A set of policy assignment names to remove from the base_archetype.\n"
  type        = set(string)
  default     = []
}

variable "policy_definitions_to_add" {
  description = "A set of policy definition names to add to the base_archetype.\nThe definition must exist in one of the loaded lib directories.\n"
  type        = set(string)
  default     = []
}

variable "policy_definitions_to_remove" {
  description = "A set of policy definition names to remove from the base_archetype.\n"
  type        = set(string)
  default     = []
}

variable "policy_set_definitions_to_add" {
  description = "A set of policy set definition names to add to the base_archetype.\nThe definition must exist in one of the loaded lib directories.\n"
  type        = set(string)
  default     = []
}

variable "policy_set_definitions_to_remove" {
  description = "A set of policy set definition names to remove from the base_archetype.\n"
  type        = set(string)
  default     = []
}

variable "role_assignments" {
  description = ""
  type = map(object({
    role_definition_id   = optional(string, "")
    role_definition_name = optional(string, "")
    principal_id         = string
    description          = optional(string, null)
  }))
  default = {}
}

variable "role_definitions_to_add" {
  description = "A set of role definition names to add to the base_archetype.\nThe definition must exist in one of the loaded lib directories.\n"
  type        = set(string)
  default     = []
}

variable "role_definitions_to_remove" {
  description = "A set of role definition names to remove from the base_archetype.\n"
  type        = set(string)
  default     = []
}

variable "subscription_ids" {
  description = "A set of subscription ids to move under this management group.\n"
  type        = set(string)
  default     = []
}
