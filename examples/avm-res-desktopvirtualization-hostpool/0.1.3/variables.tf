variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
  type = map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), ["allLogs"])
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetry.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "lock" {
  description = "The lock level to apply to the AVD Host Pool. Default is ReadOnly. Possible values areDelete, and ReadOnly."
  type = object({
    name = optional(string, null)
    kind = optional(string, "None")
  })
  default = {}
}

variable "private_endpoints" {
  description = "A map of private endpoints to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the private endpoint. One will be generated if not set.\n- role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n- lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n- tags - (Optional) A mapping of tags to assign to the private endpoint.\n- subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n- private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n- private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n- application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n- network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n- location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n- resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of this resource.\n- ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - The name of the IP configuration.\n  - private_ip_address - The private IP address of the IP configuration.\n"
  type = map(object({
    name = optional(string, null)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})
    lock = optional(object({
      name = optional(string, null)
      kind = optional(string, "None")
    }), {})
    tags                                    = optional(map(any), null)
    subnet_resource_id                      = string
    private_dns_zone_group_name             = optional(string, "default")
    private_dns_zone_resource_ids           = optional(set(string), [])
    application_security_group_associations = optional(map(string), {})
    private_service_connection_name         = optional(string, null)
    network_interface_name                  = optional(string, null)
    location                                = optional(string, null)
    resource_group_name                     = optional(string, null)
    ip_configurations = optional(map(object({
      name               = string
      private_ip_address = string
    })), {})
  }))
  default = {}
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on the AVD Host Pool. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    condition                              = string
    condition_version                      = string
    skip_service_principal_aad_check       = bool
    delegated_managed_identity_resource_id = string
  }))
  default = {}
}

variable "tags" {
  description = "Map of tags to assign to the Key Vault resource."
  type        = map(any)
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

variable "virtual_desktop_host_pool_custom_rdp_properties" {
  description = "(Optional) A valid custom RDP properties string for the Virtual Desktop Host Pool, available properties can be [found in this article](https://docs.microsoft.com/windows-server/remote/remote-desktop-services/clients/rdp-files)."
  type        = string
  default     = null
}

variable "virtual_desktop_host_pool_description" {
  description = "(Optional) A description for the Virtual Desktop Host Pool."
  type        = string
  default     = null
}

variable "virtual_desktop_host_pool_friendly_name" {
  description = "(Optional) A friendly name for the Virtual Desktop Host Pool."
  type        = string
  default     = null
}

variable "virtual_desktop_host_pool_load_balancer_type" {
  description = "(Required) BreadthFirst load balancing distributes new user sessions across all available session hosts in the host pool. Possible values are BreadthFirst, DepthFirst and Persistent. DepthFirst load balancing distributes new user sessions to an available session host with the highest number of connections but has not reached its maximum session limit threshold. Persistent should be used if the host pool type is Personal"
  type        = string
  default     = ""
}

variable "virtual_desktop_host_pool_location" {
  description = "(Required) The location/region where the Virtual Desktop Host Pool is located. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_host_pool_maximum_sessions_allowed" {
  description = "(Optional) A valid integer value from 0 to 999999 for the maximum number of users that have concurrent sessions on a session host. Should only be set if the type of your Virtual Desktop Host Pool is Pooled."
  type        = number
  default     = null
}

variable "virtual_desktop_host_pool_name" {
  description = "(Required) The name of the Virtual Desktop Host Pool. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_host_pool_personal_desktop_assignment_type" {
  description = "(Optional) Automatic assignment"
  type        = string
  default     = null
}

variable "virtual_desktop_host_pool_preferred_app_group_type" {
  description = "Preferred App Group type to display"
  type        = string
  default     = null
}

variable "virtual_desktop_host_pool_resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Virtual Desktop Host Pool. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_host_pool_scheduled_agent_updates" {
  description = "- enabled - (Optional) Enables or disables scheduled updates of the AVD agent components (RDAgent, Geneva Monitoring agent, and side-by-side stack) on session hosts. If this is enabled then up to two schedule blocks must be defined. Default is false.\n- timezone - (Optional) Specifies the time zone in which the agent update schedule will apply. If use_session_host_timezone is enabled then it will override this setting. Default is UTC\n- use_session_host_timezone - (Optional) Specifies whether scheduled agent updates should be applied based on the timezone of the affected session host. If configured then this setting overrides timezone. Default is false.\n\n---\nschedule block supports the following:\n- day_of_week - (Required) The day of the week on which agent updates should be performed. Possible values are Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, and Sunday\n- hour_of_day - (Required) The hour of day the update window should start. The update is a 2 hour period following the hour provided. The value should be provided as a number between 0 and 23, with 0 being midnight and 23 being 11pm. A leading zero should not be used.\n"
  type = object({
    enabled                   = optional(bool)
    timezone                  = optional(string)
    use_session_host_timezone = optional(bool)
    schedule = optional(list(object({
      day_of_week = string
      hour_of_day = number
    })))
  })
  default = null
}

variable "virtual_desktop_host_pool_start_vm_on_connect" {
  description = "(Optional) Enables or disables the Start VM on Connection Feature. Defaults to false."
  type        = bool
  default     = null
}

variable "virtual_desktop_host_pool_tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "virtual_desktop_host_pool_timeouts" {
  description = "- create - (Defaults to 60 minutes) Used when creating the Virtual Desktop Host Pool.\n- delete - (Defaults to 60 minutes) Used when deleting the Virtual Desktop Host Pool.\n- read - (Defaults to 5 minutes) Used when retrieving the Virtual Desktop Host Pool.\n- update - (Defaults to 60 minutes) Used when updating the Virtual Desktop Host Pool.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "virtual_desktop_host_pool_type" {
  description = "(Required) The type of the Virtual Desktop Host Pool. Valid options are Personal or Pooled. Changing the type forces a new resource to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_host_pool_validate_environment" {
  description = "(Optional) Allows you to test service changes before they are deployed to production. Defaults to false."
  type        = bool
  default     = null
}
