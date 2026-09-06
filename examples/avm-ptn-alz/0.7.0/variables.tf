variable "architecture_name" {
  description = "The name of the architecture to create. This needs to be of the *.alz_architecture_definition.[json|yaml|yml] files.\n"
  type        = string
  default     = ""
}

variable "delays" {
  description = "A map of delays to apply to the creation and destruction of resources.\nIncluded to work around some race conditions in Azure.\n"
  type = object({
    after_management_group = optional(object({
      create  = optional(string, "30s")
      destroy = optional(string, "0s")
    }), {})
    after_policy_definitions = optional(object({
      create  = optional(string, "30s")
      destroy = optional(string, "0s")
    }), {})
    after_policy_set_definitions = optional(object({
      create  = optional(string, "30s")
      destroy = optional(string, "0s")
    }), {})
  })
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The default location for resources in this management group. Used for policy managed identities.\n"
  type        = string
  default     = ""
}

variable "parent_resource_id" {
  description = "The resource id of the parent management group. Use the tenant id to create a child of the tenant root group.\nThe azurerm_client_config/azapi_client_config data sources are able to retrieve the tenant id.\n"
  type        = string
  default     = ""
}

variable "policy_assignments_to_modify" {
  description = "A map of policy assignment objects to modify the ALZ architecture with.\nYou only need to specify the properties you want to change.\n\nThe key is the id of the management group. The value is an object with a single attribute, policy_assignments.\nThe policy_assignments value is a map of policy assignments to modify.\nThe key of this map is the assignment name, and the value is an object with optional attributes for modifying the policy assignments.\n\n- enforcement_mode - (Optional) The enforcement mode of the policy assignment. Possible values are Default and DoNotEnforce.\n- identity - (Optional) The identity of the policy assignment. Possible values are SystemAssigned and UserAssigned.\n- identity_ids - (Optional) A set of ids of the user assigned identities to assign to the policy assignment.\n- non_compliance_message - (Optional) A set of non compliance message objects to use for the policy assignment. Each object has the following properties:\n  - message - (Required) The non compliance message.\n  - policy_definition_reference_id - (Optional) The reference id of the policy definition to use for the non compliance message.\n- parameters - (Optional) A JSON string of parameters to use for the policy assignment. E.g. jsonencode({\"param1\": \"value1\", \"param2\": 2}).\n- resource_selectors - (Optional) A list of resource selector objects to use for the policy assignment. Each object has the following properties:\n  - name - (Required) The name of the resource selector.\n  - selectors - (Optional) A list of selector objects to use for the resource selector. Each object has the following properties:\n    - kind - (Required) The kind of the selector. Allowed values are: resourceLocation, resourceType, resourceWithoutLocation. resourceWithoutLocation cannot be used in the same resource selector as resourceLocation.\n    - in - (Optional) A set of strings to include in the selector.\n    - not_in - (Optional) A set of strings to exclude from the selector.\n- overrides - (Optional) A list of override objects to use for the policy assignment. Each object has the following properties:\n  - kind - (Required) The kind of the override.\n  - value - (Required) The value of the override. Supported values are policy effects: <https://learn.microsoft.com/azure/governance/policy/concepts/effects>.\n  - selectors - (Optional) A list of selector objects to use for the override. Each object has the following properties:\n    - kind - (Required) The kind of the selector.\n    - in - (Optional) A set of strings to include in the selector.\n    - not_in - (Optional) A set of strings to exclude from the selector.\n"
  type = map(object({
    policy_assignments = map(object({
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
  }))
  default = {}
}

variable "timeouts" {
  description = "A map of timeouts to apply to the creation and destruction of resources.\n"
  type = object({
    management_group = optional(object({
      create = optional(string, "10m")
      delete = optional(string, "10m")
      update = optional(string, "10m")
      read   = optional(string, "10m")
      }), {}
    )
    role_definition = optional(object({
      create = optional(string, "10m")
      delete = optional(string, "10m")
      update = optional(string, "10m")
      read   = optional(string, "10m")
      }), {}
    )
    policy_definition = optional(object({
      create = optional(string, "10m")
      delete = optional(string, "10m")
      update = optional(string, "10m")
      read   = optional(string, "10m")
      }), {}
    )
    policy_set_definition = optional(object({
      create = optional(string, "10m")
      delete = optional(string, "10m")
      update = optional(string, "10m")
      read   = optional(string, "10m")
      }), {}
    )
    policy_assignment = optional(object({
      create = optional(string, "10m")
      delete = optional(string, "10m")
      update = optional(string, "10m")
      read   = optional(string, "10m")
      }), {}
    )
    policy_role_assignment = optional(object({
      create = optional(string, "10m")
      delete = optional(string, "10m")
      update = optional(string, "10m")
      read   = optional(string, "10m")
      }), {}
    )
  })
  default = {}
}
