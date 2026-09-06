variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "idle_timeout_in_minutes" {
  description = "(Optional) The idle timeout which should be used in minutes. Defaults to 4."
  type        = number
  default     = null
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the NAT Gateway should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n  \n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "(Required) Specifies the name of the NAT Gateway. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "public_ip_prefix_length" {
  description = "(Optional) Public IP-prefix CIDR mask to use. Set to 0 to disable."
  type        = number
  default     = 0
}

variable "resource_group_name" {
  description = "(Required) Specifies the name of the Resource Group in which the NAT Gateway should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - The description of the role assignment.\n  - skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - The condition which will be used to scope the role assignment.\n  - condition_version - The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  \n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
  }))
  default = {}
}

variable "sku_name" {
  description = "(Optional) The SKU which should be used. At this time the only supported value is Standard. Defaults to Standard."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 60 minutes) Used when creating the NAT Gateway.\n- delete - (Defaults to 60 minutes) Used when deleting the NAT Gateway.\n- read - (Defaults to 5 minutes) Used when retrieving the NAT Gateway.\n- update - (Defaults to 60 minutes) Used when updating the NAT Gateway.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "zones" {
  description = "(Optional) A list of Availability Zones in which this NAT Gateway should be located. Changing this forces a new NAT Gateway to be created."
  type        = set(string)
  default     = null
}
