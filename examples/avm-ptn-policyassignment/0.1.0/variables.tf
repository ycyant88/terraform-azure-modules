variable "delays" {
  description = "A map of delays to apply to the creation and destruction of resources.\nIncluded to work around some race conditions in Azure.\n"
  type = object({
    before_policy_assignments = optional(object({
      create  = optional(string, "30s")
      destroy = optional(string, "0s")
    }), {})
    before_policy_role_assignments = optional(object({
      create  = optional(string, "60s")
      destroy = optional(string, "0s")
    }), {})
    before_policy_exemptions = optional(object({
      create  = optional(string, "30s")
      destroy = optional(string, "0s")
    }), {})
  })
  default = {}
}

variable "description" {
  description = "(Optional) A description which should be used for this Policy Assignment."
  type        = string
  default     = ""
}

variable "display_name" {
  description = "(Optional) The Display Name for this Policy Assignment."
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "enforce" {
  description = "(Optional) Specifies if this Policy should be enforced or not? Options are Default and DoNotEnforce."
  type        = string
  default     = "Default"
}

variable "exemptions" {
  description = "  - name - (Required) The name of the Policy Exemption. Changing this forces a new resource to be created.\n- resource_id - (Required) The Resource ID where the Policy Exemption should be applied. Changing this forces a new resource to be created.\n- exemption_category - (Required) The category of this policy exemption. Possible values are Waiver and Mitigated.\n- policy_assignment_id - (Required) The ID of the Policy Assignment to be exempted at the specified Scope. Changing this forces a new resource to be created.\n- description - (Optional) A description to use for this Policy Exemption.\n- display_name - (Optional) A friendly display name to use for this Policy Exemption.\n- expires_on - (Optional) The expiration date and time in UTC ISO 8601 format of this policy exemption.\n- policy_definition_reference_ids - (Optional) The policy definition reference ID list when the associated policy assignment is an assignment of a policy set definition.\n- metadata - (Optional) The metadata for this policy exemption. This is a JSON string representing additional metadata that should be stored with the policy exemption.\n"
  type = list(object({
    resource_id                     = string
    policy_definition_reference_ids = optional(list(string))
    exemption_category              = string
  }))
  default = []
}

variable "identity" {
  description = "  (Optional) An identity block as defined below.\n   - type - (Required) SystemAssigned or UserAssigned.\n"
  type = object({
    type = string
  })
  default = null
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "metadata" {
  description = "(Optional) A mapping of any Metadata for this Policy."
  type        = map(any)
  default     = {}
}

variable "name" {
  description = "(Optional) The Display Name for this Policy Assignment."
  type        = string
  default     = ""
}

variable "non_compliance_messages" {
  description = "  (Optional) A set of non compliance message objects to use for the policy assignment. Each object has the following properties:\n  - message - (Required) The non compliance message.\n  - policy_definition_reference_id - (Optional) The reference id of the policy definition to use for the non compliance message.\n"
  type = set(object({
    message                        = string
    policy_definition_reference_id = optional(string, null)
  }))
  default = []
}

variable "not_scopes" {
  description = "(Optional) Specifies a list of Resource Scopes (for example a Subscription, or a Resource Group) within this Management Group which are excluded from this Policy."
  type        = list(string)
  default     = []
}

variable "overrides" {
  description = "(Optional) A list of override objects to use for the policy assignment. Each object has the following properties:\n  - kind - (Required) The kind of the override.\n  - value - (Required) The value of the override. Supported values are policy effects: <https://learn.microsoft.com/azure/governance/policy/concepts/effects>.\n  - selectors - (Optional) A list of selector objects to use for the override. Each object has the following properties:\n    - kind - (Required) The kind of the selector.\n    - in - (Optional) A set of strings to include in the selector.\n    - not_in - (Optional) A set of strings to exclude from the selector.\n\n"
  type = list(object({
    kind  = string
    value = string
    selectors = optional(list(object({
      kind   = string
      in     = optional(set(string), null)
      not_in = optional(set(string), null)
    })), [])
  }))
  default = []
}

variable "parameters" {
  description = "(Optional) A mapping of any Parameters for this Policy."
  type        = map(any)
  default     = null
}

variable "policy_definition_id" {
  description = "(Required) The ID of the Policy Definition or Policy Definition Set. Changing this forces a new Policy Assignment to be created."
  type        = string
  default     = ""
}

variable "resource_selectors" {
  description = "(Optional) A list of resource selector objects to use for the policy assignment. Each object has the following properties:\n  - name - (Required) The name of the resource selector.\n  - selectors - (Optional) A list of selector objects to use for the resource selector. Each object has the following properties:\n    - kind - (Required) The kind of the selector. Allowed values are: resourceLocation, resourceType, resourceWithoutLocation. resourceWithoutLocation cannot be used in the same resource selector as resourceLocation.\n    - in - (Optional) A set of strings to include in the selector.\n    - not_in - (Optional) A set of strings to exclude from the selector.\n"
  type = list(object({
    name = string
    selectors = optional(list(object({
      kind   = string
      in     = optional(set(string), null)
      not_in = optional(set(string), null)
    })), [])
  }))
  default = []
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  \n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    role_definition_id_or_name = string
    # principal_id                           = optional(string, null) # TODO the principal_id is not known before policy assignment
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

variable "schema_validation_enabled" {
  description = "(Optional) Specifies if this Policy should be validated against the schema. Defaults to true."
  type        = bool
  default     = true
}

variable "scope" {
  description = "(Required) The Scope at which this Policy Assignment should be applied. Changing this forces a new Policy Assignment to be created."
  type        = string
  default     = ""
}
