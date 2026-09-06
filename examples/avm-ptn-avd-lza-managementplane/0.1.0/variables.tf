variable "customer_managed_key" {
  description = "Customer managed keys that should be associated with the resource."
  type = object({
    key_vault_resource_id              = optional(string)
    key_name                           = optional(string)
    key_version                        = optional(string, null)
    user_assigned_identity_resource_id = optional(string, null)
  })
  default = {}
}

variable "day_of_week" {
  description = "The day of the week to apply the schedule agent update. Value must be one of: 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', or 'Saturday'."
  type        = string
  default     = "Sunday"
}

variable "description" {
  description = "The description of the AVD."
  type        = string
  default     = ""
}

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
  description = "This variable controls whether or not telemetry is enabled for the module.\n\nFor more information see <https://aka.ms/avm/telemetryinfo>.\n\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "hostpooltype" {
  description = "The type of the AVD Host Pool. Valid values are 'Pooled' and 'Personal'."
  type        = string
  default     = ""
}

variable "hour_of_day" {
  description = "The hour of the day to apply the schedule agent update. Value must be between 0 and 23."
  type        = number
  default     = 2
}

variable "location" {
  description = "The Azure location where the resources will be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "The lock level to apply. Default is None. Possible values are None, CanNotDelete, and ReadOnly."
  type = object({
    name = optional(string, null)
    kind = optional(string, "None")
  })
  default = {}
}

variable "managed_identities" {
  description = "Managed identities to be created for the resource."
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "maxsessions" {
  description = "The maximum number of sessions allowed on each session host in the host pool."
  type        = number
  default     = 16
}

variable "name" {
  description = "The name of the AVD Host Pool, Application Group or Workspace."
  type        = string
  default     = ""
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

variable "public_network_access_enabled" {
  description = "Whether or not public network access is enabled for the AVD Workspace."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the resource group where the resources will be deployed.\n"
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "subresource_names" {
  description = "The names of the subresources to assosciatied with the private endpoint. The target subresource must be one of: 'feed', or 'global'."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "The map of tags to be applied to the resource"
  type        = map(any)
  default     = {}
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

variable "type" {
  description = "The type of the AVD Application Group. Valid values are 'Desktop' and 'RemoteApp'."
  type        = string
  default     = ""
}

variable "user_group_name" {
  description = "Microsoft Entra ID User Group for AVD users"
  type        = string
  default     = ""
}
