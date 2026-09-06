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
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "hostpool" {
  description = "The name of the AVD Host Pool to assign the scaling plan to."
  type        = string
  default     = ""
}

variable "location" {
  description = "The Azure location where the resources will be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "The lock level to apply to the AVD Host Pool. Default is ReadOnly. Possible values areDelete, and ReadOnly."
  type = object({
    name = optional(string, null)
    kind = optional(string, "None")
  })
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

variable "scalingplan" {
  description = "The name of the AVD Application Group."
  type        = string
  default     = ""
}

variable "schedules" {
  description = "A map of schedules to create on AVD Scaling Plan. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name -  The name of the schedule.\n- days_of_week -  The days of the week to apply the schedule to. \n- off_peak_start_time -  The start time of the off peak period. \n- off_peak_load_balancing_algorithm -  The load balancing algorithm to use during the off peak period. \n- ramp_down_capacity_threshold_percent -  The capacity threshold percentage to use during the ramp down period. \n- ramp_down_force_logoff_users -  Whether to force log off users during the ramp down period. \n- ramp_down_load_balancing_algorithm -  The load balancing algorithm to use during the ramp down period. \n- ramp_down_minimum_hosts_percent -  The minimum hosts percentage to use during the ramp down period. \n- ramp_down_notification_message -  The notification message to use during the ramp down period. \n- ramp_down_start_time -  The start time of the ramp down period. \n- ramp_down_stop_hosts_when -  When to stop hosts during the ramp down period. \n- ramp_down_wait_time_minutes -  The wait time in minutes to use during the ramp down period. \n- peak_start_time -  The start time of the peak period. \n- peak_load_balancing_algorithm -  The load balancing algorithm to use during the peak period. \n- ramp_up_capacity_threshold_percent - (Optional) The capacity threshold percentage to use during the ramp up period. \n- ramp_up_load_balancing_algorithm -  The load balancing algorithm to use during the ramp up period. \n- ramp_up_minimum_hosts_percent - (Optional) The minimum hosts percentage to use during the ramp up period. \n- ramp_up_start_time -  The start time of the ramp up period. \n"
  type = map(object({
    name                                 = string
    days_of_week                         = set(string)
    off_peak_start_time                  = string
    off_peak_load_balancing_algorithm    = string
    ramp_down_capacity_threshold_percent = number
    ramp_down_force_logoff_users         = bool
    ramp_down_load_balancing_algorithm   = string
    ramp_down_minimum_hosts_percent      = number
    ramp_down_notification_message       = string
    ramp_down_start_time                 = string
    ramp_down_stop_hosts_when            = string
    ramp_down_wait_time_minutes          = number
    peak_start_time                      = string
    peak_load_balancing_algorithm        = string
    ramp_up_capacity_threshold_percent   = optional(number)
    ramp_up_load_balancing_algorithm     = string
    ramp_up_minimum_hosts_percent        = optional(number)
    ramp_up_start_time                   = string
  }))
  default = { "schedule1" : { "days_of_week" : ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"], "name" : "Weekdays", "off_peak_load_balancing_algorithm" : "DepthFirst", "off_peak_start_time" : "22:00", "peak_load_balancing_algorithm" : "BreadthFirst", "peak_start_time" : "09:00", "ramp_down_capacity_threshold_percent" : 5, "ramp_down_force_logoff_users" : false, "ramp_down_load_balancing_algorithm" : "DepthFirst", "ramp_down_minimum_hosts_percent" : 10, "ramp_down_notification_message" : "Please log off in the next 45 minutes...", "ramp_down_start_time" : "19:00", "ramp_down_stop_hosts_when" : "ZeroSessions", "ramp_down_wait_time_minutes" : 45, "ramp_up_capacity_threshold_percent" : 10, "ramp_up_load_balancing_algorithm" : "BreadthFirst", "ramp_up_minimum_hosts_percent" : 20, "ramp_up_start_time" : "05:00" } }
}

variable "tags" {
  description = "Map of tags to assign to the Scaling Plan resource."
  type        = map(any)
  default     = null
}

variable "time_zone" {
  description = "The time zone of the AVD Scaling Plan."
  type        = string
  default     = "Eastern Standard Time"
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
