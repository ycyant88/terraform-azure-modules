variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
  type = map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), ["allLogs"])
    metric_categories                        = optional(set(string), ["AllMetrics"])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n  \n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "role_assignment_timeouts" {
  description = "- create - (Defaults to 30 minutes) Used when creating the Role Assignment.\n- delete - (Defaults to 30 minutes) Used when deleting the Role Assignment.\n- read - (Defaults to 5 minutes) Used when retrieving the Role Assignment.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
  })
  default = null
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - The description of the role assignment.\n  - skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - The condition which will be used to scope the role assignment.\n  - condition_version - The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  \n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "tracing_tags_enabled" {
  description = "Whether enable tracing tags that generated by BridgeCrew Yor."
  type        = bool
  default     = false
}

variable "tracing_tags_prefix" {
  description = "Default prefix for generated tracing tags"
  type        = string
  default     = "avm_"
}

variable "user_group_name" {
  description = "Microsoft Entra ID User Group for AVD users"
  type        = string
  default     = ""
}

variable "virtual_desktop_application_group_default_desktop_display_name" {
  description = "(Optional) Option to set the display name for the default sessionDesktop desktop when type is set to Desktop."
  type        = string
  default     = null
}

variable "virtual_desktop_application_group_description" {
  description = "(Optional) Option to set a description for the Virtual Desktop Application Group."
  type        = string
  default     = null
}

variable "virtual_desktop_application_group_friendly_name" {
  description = "(Optional) Option to set a friendly name for the Virtual Desktop Application Group."
  type        = string
  default     = null
}

variable "virtual_desktop_application_group_host_pool_id" {
  description = "(Required) Resource ID for a Virtual Desktop Host Pool to associate with the Virtual Desktop Application Group. Changing the name forces a new resource to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_application_group_location" {
  description = "(Required) The location/region where the Virtual Desktop Application Group is located. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_application_group_name" {
  description = "(Required) The name of the Virtual Desktop Application Group. Changing the name forces a new resource to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_application_group_resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Virtual Desktop Application Group. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_application_group_tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "virtual_desktop_application_group_timeouts" {
  description = "- create - (Defaults to 60 minutes) Used when creating the Virtual Desktop Application Group.\n- delete - (Defaults to 60 minutes) Used when deleting the Virtual Desktop Application Group.\n- read - (Defaults to 5 minutes) Used when retrieving the Virtual Desktop Application Group.\n- update - (Defaults to 60 minutes) Used when updating the Virtual Desktop Application Group.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "virtual_desktop_application_group_type" {
  description = "(Required) Type of Virtual Desktop Application Group. Valid options are RemoteApp or Desktop application groups. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}
