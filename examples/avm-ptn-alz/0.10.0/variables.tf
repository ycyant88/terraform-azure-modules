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

variable "dependencies" {
  description = "Place dependent values into this variable to ensure that resources are created in the correct order.\nEnsure that the values placed here are computed/known after apply, e.g. the resource ids.\n\nThis is necessary as the unknown values and depends_on are not supported by this module as we use the alz provider.\nSee the \"Unknown Values & Depends On\" section above for more information.\n\ne.g.\n\nhcl\ndependencies = {\n  policy_role_assignments = [\n    module.dependency_example1.output,\n    module.dependency_example2.output,\n  ]\n}\n\n"
  type = object({
    policy_role_assignments = optional(any, null)
    policy_assignments      = optional(any, null)
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

variable "management_group_hierarchy_settings" {
  description = "Set this value to configure the hierarchy settings. Options are:\n\n- default_management_group_name - (Required) The name of the default management group.\n- require_authorization_for_group_creation - (Optional) By default, all Entra security principals can create new management groups. When enabled, security principals must have management group write access to create new management groups. Defaults to true.\n- update_existing - (Optional) Update existing hierarchy settings rather than create new. Defaults to false.\n"
  type = object({
    default_management_group_name            = string
    require_authorization_for_group_creation = optional(bool, true)
    update_existing                          = optional(bool, false)
  })
  default = null
}

variable "parent_resource_id" {
  description = "The resource name of the parent management group. Use the tenant id to create a child of the tenant root group.\nThe azurerm_client_config/azapi_client_config data sources are able to retrieve the tenant id.\nDo not include the /providers/Microsoft.Management/managementGroups/ prefix.\n"
  type        = string
  default     = ""
}

variable "partner_id" {
  description = "A value to be included in the telemetry tag. Requires the enable_telemetry variable to be set to true. The must be in the following format:\n\n<PARTNER_ID_UUID>:<PARTNER_DATA_UUID>\n\ne.g.\n\n00000000-0000-0000-0000-000000000000:00000000-0000-0000-0000-000000000000\n"
  type        = string
  default     = null
}

variable "policy_assignments_to_modify" {
  description = "A map of policy assignment objects to modify the ALZ architecture with.\nYou only need to specify the properties you want to change.\n\nThe key is the id of the management group. The value is an object with a single attribute, policy_assignments.\nThe policy_assignments value is a map of policy assignments to modify.\nThe key of this map is the assignment name, and the value is an object with optional attributes for modifying the policy assignments.\n\n- enforcement_mode - (Optional) The enforcement mode of the policy assignment. Possible values are Default and DoNotEnforce.\n- identity - (Optional) The identity of the policy assignment. Possible values are SystemAssigned and UserAssigned.\n- identity_ids - (Optional) A set of ids of the user assigned identities to assign to the policy assignment.\n- non_compliance_message - (Optional) A set of non compliance message objects to use for the policy assignment. Each object has the following properties:\n  - message - (Required) The non compliance message.\n  - policy_definition_reference_id - (Optional) The reference id of the policy definition to use for the non compliance message.\n- parameters - (Optional) The parameters to use for the policy assignment. The map key is the parameter name and the value is an JSON object containing a single Value attribute with the values to apply. This to mitigate issues with the Terraform type system. E.g. { defaultName = jsonencode({Value = \\\"value\\\"}) }.\n- resource_selectors - (Optional) A list of resource selector objects to use for the policy assignment. Each object has the following properties:\n  - name - (Required) The name of the resource selector.\n  - selectors - (Optional) A list of selector objects to use for the resource selector. Each object has the following properties:\n    - kind - (Required) The kind of the selector. Allowed values are: resourceLocation, resourceType, resourceWithoutLocation. resourceWithoutLocation cannot be used in the same resource selector as resourceLocation.\n    - in - (Optional) A set of strings to include in the selector.\n    - not_in - (Optional) A set of strings to exclude from the selector.\n- overrides - (Optional) A list of override objects to use for the policy assignment. Each object has the following properties:\n  - kind - (Required) The kind of the override.\n  - value - (Required) The value of the override. Supported values are policy effects: <https://learn.microsoft.com/azure/governance/policy/concepts/effects>.\n  - selectors - (Optional) A list of selector objects to use for the override. Each object has the following properties:\n    - kind - (Required) The kind of the selector.\n    - in - (Optional) A set of strings to include in the selector.\n    - not_in - (Optional) A set of strings to exclude from the selector.\n"
  type = map(object({
    policy_assignments = map(object({
      enforcement_mode = optional(string, null)
      identity         = optional(string, null)
      identity_ids     = optional(list(string), null)
      parameters       = optional(map(string), null)
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
    }))
  }))
  default = {}
}

variable "policy_default_values" {
  description = "A map of default values to apply to policy assignments. The key is the default name as defined in the library, and the value is an JSON object containing a single value attribute with the values to apply. This to mitigate issues with the Terraform type system. E.g. { defaultName = jsonencode({ value = \\\"value\\\"}) }\n"
  type        = map(string)
  default     = null
}

variable "retries" {
  description = "The retry settings to apply to the CRUD operations. Value is a nested object, the top level keys are the resources and the values are an object with the following attributes:\n\n- error_message_regex - (Optional) A list of error message regexes to retry on. Defaults to null, which will will disable retries. Specify a value to enable.\n- interval_seconds - (Optional) The initial interval in seconds between retries. Defaults to null and will fall back to the provider default value.\n- max_interval_seconds - (Optional) The maximum interval in seconds between retries. Defaults to null and will fall back to the provider default value.\n- multiplier - (Optional) The multiplier to apply to the interval between retries. Defaults to null and will fall back to the provider default value.\n- randomization_factor - (Optional) The randomization factor to apply to the interval between retries. Defaults to null and will fall back to the provider default value.\n\nFor more information please see the provider documentation here: <https://registry.terraform.io/providers/Azure/azapi/azurerm/latest/docs/resources/resource#nestedatt--retry>\n"
  type = object({
    management_groups = optional(object({
      error_message_regex = optional(list(string), [
        "AuthorizationFailed" # Avoids a eventual consistency issue where a recently created management group is not yet available for a GET operation.
      ])
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    role_definitions = optional(object({
      error_message_regex  = optional(list(string), null)
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    policy_definitions = optional(object({
      error_message_regex  = optional(list(string), null)
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    policy_set_definitions = optional(object({
      error_message_regex  = optional(list(string), null)
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    policy_assignments = optional(object({
      error_message_regex = optional(list(string), [
        "The policy definition specified in policy assignment '.+' is out of scope" # If assignment is created soon after a policy definition has been created then the assignment will fail with this error.
      ])
      interval_seconds     = optional(number, 5)
      max_interval_seconds = optional(number, 30)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    policy_role_assignments = optional(object({
      error_message_regex = optional(list(string), [
        "ResourceNotFound", # If the resource has just been created, retry until it is available.
      ])
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    hierarchy_settings = optional(object({
      error_message_regex  = optional(list(string), null)
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
    subscription_placement = optional(object({
      error_message_regex  = optional(list(string), null)
      interval_seconds     = optional(number, null)
      max_interval_seconds = optional(number, null)
      multiplier           = optional(number, null)
      randomization_factor = optional(number, null)
    }), {})
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

variable "timeouts" {
  description = "A map of timeouts to apply to the creation and destruction of resources.\n"
  type = object({
    management_group = optional(object({
      create = optional(string, "5m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "5m")
      }), {}
    )
    role_definition = optional(object({
      create = optional(string, "5m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "5m")
      }), {}
    )
    policy_definition = optional(object({
      create = optional(string, "5m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "5m")
      }), {}
    )
    policy_set_definition = optional(object({
      create = optional(string, "5m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "5m")
      }), {}
    )
    policy_assignment = optional(object({
      create = optional(string, "15m") # Set high to allow consolidation of policy definitions coming into scope
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "5m")
      }), {}
    )
    policy_role_assignment = optional(object({
      create = optional(string, "5m")
      delete = optional(string, "5m")
      update = optional(string, "5m")
      read   = optional(string, "5m")
      }), {}
    )
  })
  default = {}
}
