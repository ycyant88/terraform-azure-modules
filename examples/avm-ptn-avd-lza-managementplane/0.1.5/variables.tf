variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\n\nFor more information see <https://aka.ms/avm/telemetryinfo>.\n\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "(Required) The location/region where the Azure Virtual Desktop resources are located. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace to use for diagnostics."
  type        = string
  default     = ""
}

variable "managed_identities" {
  description = "Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n- system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n- user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "private_endpoints" {
  description = "A map of private endpoints to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- name - (Optional) The name of the private endpoint. One will be generated if not set.\n- role_assignments - (Optional) A map of role assignments to create on the private endpoint. Each role assignment should include a role_definition_id_or_name and a principal_id.\n- lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n- tags - (Optional) A mapping of tags to assign to the private endpoint. Each tag should be a string.\n- subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n- private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n- private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n- application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n- network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n- location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n- resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the resource.\n- ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. Each IP configuration should include a name and a private_ip_address.\n"
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
      principal_type                         = optional(string, null)
    })), {})
    lock = optional(object({
      name = optional(string, null)
      kind = string
    }), null)
    tags                                    = optional(map(string), null)
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

variable "public_network_access_enabled" {
  description = "Whether or not public network access is enabled for the AVD Workspace."
  type        = bool
  default     = true
}

variable "registration_expiration_period" {
  description = "The expiration period for the registration token. Must be less than or equal to 30 days."
  type        = string
  default     = "48h"
}

variable "resource_group_name" {
  description = "The name of the resource group in which the AVD Private Endpoint should be created."
  type        = string
  default     = ""
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

variable "subresource_names" {
  description = "The names of the subresources to assosciatied with the private endpoint. The target subresource must be one of: 'feed', or 'global'."
  type        = list(string)
  default     = []
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

variable "virtual_desktop_application_group_name" {
  description = "(Required) The name of the Virtual Desktop Application Group. Changing the name forces a new resource to be created."
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

variable "virtual_desktop_host_pool_custom_rdp_properties" {
  description = "(Optional) A valid custom RDP properties string for the Virtual Desktop Host Pool, available properties can be [found in this article](https://docs.microsoft.com/windows-server/remote/remote-desktop-services/clients/rdp-files)."
  type        = string
  default     = "drivestoredirect:s:*;audiomode:i:0;videoplaybackmode:i:1;redirectclipboard:i:1;redirectprinters:i:1;devicestoredirect:s:*;redirectcomports:i:1;redirectsmartcards:i:1;usbdevicestoredirect:s:*;enablecredsspsupport:i:1;use multimon:i:0"
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

variable "virtual_desktop_scaling_plan_name" {
  description = "(Required) The name which should be used for this Virtual Desktop Scaling Plan . Changing this forces a new Virtual Desktop Scaling Plan to be created."
  type        = string
  default     = ""
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

variable "virtual_desktop_workspace_description" {
  description = "(Optional) A description for the Virtual Desktop Workspace."
  type        = string
  default     = null
}

variable "virtual_desktop_workspace_friendly_name" {
  description = "(Optional) A friendly name for the Virtual Desktop Workspace."
  type        = string
  default     = null
}

variable "virtual_desktop_workspace_name" {
  description = "(Required) The name of the Virtual Desktop Workspace. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "virtual_desktop_workspace_public_network_access_enabled" {
  description = "(Optional) Whether public network access is allowed for this Virtual Desktop Workspace. Defaults to true."
  type        = bool
  default     = null
}

variable "virtual_desktop_workspace_tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "virtual_desktop_workspace_timeouts" {
  description = "- create - (Defaults to 60 minutes) Used when creating the Virtual Desktop Workspace.\n- delete - (Defaults to 60 minutes) Used when deleting the Virtual Desktop Workspace.\n- read - (Defaults to 5 minutes) Used when retrieving the Virtual Desktop Workspace.\n- update - (Defaults to 60 minutes) Used when updating the Virtual Desktop Workspace.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
