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
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
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
    principal_type                         = optional(string, null)
  }))
  default = {}
}

variable "virtual_desktop_scaling_plan_description" {
  description = "(Optional) A description of the Scaling Plan."
  type        = string
  default     = null
}

variable "virtual_desktop_scaling_plan_exclusion_tag" {
  description = "(Optional) The name of the tag associated with the VMs you want to exclude from autoscaling."
  type        = string
  default     = null
}

variable "virtual_desktop_scaling_plan_friendly_name" {
  description = "(Optional) Friendly name of the Scaling Plan."
  type        = string
  default     = null
}

variable "virtual_desktop_scaling_plan_host_pool" {
  description = "- hostpool_id - (Required) The ID of the HostPool to assign the Scaling Plan to.\n- scaling_plan_enabled - (Required) Specifies if the scaling plan is enabled or disabled for the HostPool.\n"
  type = list(object({
    hostpool_id          = string
    scaling_plan_enabled = bool
  }))
  default = null
}

variable "virtual_desktop_scaling_plan_location" {
  description = "(Required) The Azure Region where the Virtual Desktop Scaling Plan should exist. Changing this forces a new Virtual Desktop Scaling Plan to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_scaling_plan_name" {
  description = "(Required) The name which should be used for this Virtual Desktop Scaling Plan . Changing this forces a new Virtual Desktop Scaling Plan to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_scaling_plan_resource_group_name" {
  description = "(Required) The name of the Resource Group where the Virtual Desktop Scaling Plan should exist. Changing this forces a new Virtual Desktop Scaling Plan to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_scaling_plan_schedule" {
  description = "- days_of_week - (Required) A list of Days of the Week on which this schedule will be used. Possible values are Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, and Sunday\n- name - (Required) The name of the schedule.\n- off_peak_load_balancing_algorithm - (Required) The load Balancing Algorithm to use during Off-Peak Hours. Possible values are DepthFirst and BreadthFirst.\n- off_peak_start_time - (Required) The time at which Off-Peak scaling will begin. This is also the end-time for the Ramp-Down period. The time must be specified in \"HH:MM\" format.\n- peak_load_balancing_algorithm - (Required) The load Balancing Algorithm to use during Peak Hours. Possible values are DepthFirst and BreadthFirst.\n- peak_start_time - (Required) The time at which Peak scaling will begin. This is also the end-time for the Ramp-Up period. The time must be specified in \"HH:MM\" format.\n- ramp_down_capacity_threshold_percent - (Required) This is the value in percentage of used host pool capacity that will be considered to evaluate whether to turn on/off virtual machines during the ramp-down and off-peak hours. For example, if capacity threshold is specified as 60% and your total host pool capacity is 100 sessions, autoscale will turn on additional session hosts once the host pool exceeds a load of 60 sessions.\n- ramp_down_force_logoff_users - (Required) Whether users will be forced to log-off session hosts once the ramp_down_wait_time_minutes value has been exceeded during the Ramp-Down period. Possible\n- ramp_down_load_balancing_algorithm - (Required) The load Balancing Algorithm to use during the Ramp-Down period. Possible values are DepthFirst and BreadthFirst.\n- ramp_down_minimum_hosts_percent - (Required) The minimum percentage of session host virtual machines that you would like to get to for ramp-down and off-peak hours. For example, if Minimum percentage of hosts is specified as 10% and total number of session hosts in your host pool is 10, autoscale will ensure a minimum of 1 session host is available to take user connections.\n- ramp_down_notification_message - (Required) The notification message to send to users during Ramp-Down period when they are required to log-off.\n- ramp_down_start_time - (Required) The time at which Ramp-Down scaling will begin. This is also the end-time for the Ramp-Up period. The time must be specified in \"HH:MM\" format.\n- ramp_down_stop_hosts_when - (Required) Controls Session Host shutdown behaviour during Ramp-Down period. Session Hosts can either be shutdown when all sessions on the Session Host have ended, or when there are no Active sessions left on the Session Host. Possible values are ZeroSessions and ZeroActiveSessions.\n- ramp_down_wait_time_minutes - (Required) The number of minutes during Ramp-Down period that autoscale will wait after setting the session host VMs to drain mode, notifying any currently signed in users to save their work before forcing the users to logoff. Once all user sessions on the session host VM have been logged off, Autoscale will shut down the VM.\n- ramp_up_capacity_threshold_percent - (Optional) This is the value of percentage of used host pool capacity that will be considered to evaluate whether to turn on/off virtual machines during the ramp-up and peak hours. For example, if capacity threshold is specified as 60% and your total host pool capacity is 100 sessions, autoscale will turn on additional session hosts once the host pool exceeds a load of 60 sessions.\n- ramp_up_load_balancing_algorithm - (Required) The load Balancing Algorithm to use during the Ramp-Up period. Possible values are DepthFirst and BreadthFirst.\n- ramp_up_minimum_hosts_percent - (Optional) Specifies the minimum percentage of session host virtual machines to start during ramp-up for peak hours. For example, if Minimum percentage of hosts is specified as 10% and total number of session hosts in your host pool is 10, autoscale will ensure a minimum of 1 session host is available to take user connections.\n- ramp_up_start_time - (Required) The time at which Ramp-Up scaling will begin. This is also the end-time for the Ramp-Up period. The time must be specified in \"HH:MM\" format.\n"
  type = list(object({
    days_of_week                         = set(string)
    name                                 = string
    off_peak_load_balancing_algorithm    = string
    off_peak_start_time                  = string
    peak_load_balancing_algorithm        = string
    peak_start_time                      = string
    ramp_down_capacity_threshold_percent = number
    ramp_down_force_logoff_users         = bool
    ramp_down_load_balancing_algorithm   = string
    ramp_down_minimum_hosts_percent      = number
    ramp_down_notification_message       = string
    ramp_down_start_time                 = string
    ramp_down_stop_hosts_when            = string
    ramp_down_wait_time_minutes          = number
    ramp_up_capacity_threshold_percent   = optional(number)
    ramp_up_load_balancing_algorithm     = string
    ramp_up_minimum_hosts_percent        = optional(number)
    ramp_up_start_time                   = string
  }))
  default = ""
}

variable "virtual_desktop_scaling_plan_tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Virtual Desktop Scaling Plan ."
  type        = map(string)
  default     = null
}

variable "virtual_desktop_scaling_plan_time_zone" {
  description = "(Required) Specifies the Time Zone which should be used by the Scaling Plan for time based events, [the possible values are defined here](https://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/)."
  type        = string
  default     = ""
}

variable "virtual_desktop_scaling_plan_timeouts" {
  description = "- create - (Defaults to 1 hour) Used when creating the Virtual Desktop Scaling Plan.\n- delete - (Defaults to 1 hour) Used when deleting the Virtual Desktop Scaling Plan.\n- read - (Defaults to 5 minutes) Used when retrieving the Virtual Desktop Scaling Plan.\n- update - (Defaults to 1 hour) Used when updating the Virtual Desktop Scaling Plan.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
