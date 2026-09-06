variable "customer_managed_key" {
  description = "A map describing customer-managed keys to associate with the resource. This includes the following properties:\n- key_vault_resource_id - The resource ID of the Key Vault where the key is stored.\n- key_name - The name of the key.\n- key_version - (Optional) The version of the key. If not specified, the latest version is used.\n- user_assigned_identity - (Optional) An object representing a user-assigned identity with the following properties:\n  - resource_id - The resource ID of the user-assigned identity.\n"
  type = object({
    key_vault_resource_id = string
    key_name              = string
    key_version           = optional(string, null)
    user_assigned_identity = optional(object({
      resource_id = string
    }), null)
  })
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "(Optional) Specifies whether automatic scaling is enabled for the target resource. Defaults to true.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the AutoScale Setting should exist. Changing this forces a new resource to be created.\n"
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

variable "name" {
  description = "(Required) The name of the AutoScale Setting. Changing this forces a new resource to be created.\n"
  type        = string
  default     = ""
}

variable "notification" {
  description = "(Optional) A notification block associated to autoscale setting. Defaults to null.\n- email - (Optional) A email block as defined below.\n  - send_to_subscription_administrator - (Optional) Should email notifications be sent to the subscription administrator? Defaults to false.\n  - send_to_subscription_co_administrator - (Optional) Should email notifications be sent to the subscription co-administrator? Defaults to false.\n  - custom_emails - (Optional) Specifies a list of custom email addresses to which the email notifications will be sent.\n- webhook - (Optional) One or more webhook blocks as defined below.\n  - service_uri - (Required) The HTTPS URI which should receive scale notifications.\n  - properties - (Optional) A map of settings.\n"
  type = object({
    email = optional(object({
      send_to_subscription_administrator    = optional(bool, false)
      send_to_subscription_co_administrator = optional(bool, false)
      custom_emails                         = optional(list(string), [])
    }))
    webhooks = optional(map(object({
      service_uri = string
      properties  = optional(map(string), {})
    })))
  })
  default = null
}

variable "predictive" {
  description = "(Optional) A predictive block associated to autoscale setting. Defaults to null.\n- scale_mode - (Required) Specifies the predictive scale mode. Possible values are Enabled or ForecastOnly.\n- look_ahead_time - (Optional) Specifies the amount of time by which instances are launched in advance. It must be between PT1M and PT1H in ISO 8601 format.\n"
  type = object({
    scale_mode      = string
    look_ahead_time = optional(string)
  })
  default = null
}

variable "profiles" {
  description = "(Required) A map of profiles to associate to the AutoScale Setting. Specifies one or more (up to 20).\n- name - (Required) Specifies the name of the profile.\n- capacity - (Required) A capacity block as defined below.\n  - default - (Required) The number of instances that are available for scaling if metrics are not available for evaluation. The default is only used if the current instance count is lower than the default. Valid values are between 0 and 1000.\n  - maximum - (Required) The maximum number of instances for this resource. Valid values are between 0 and 1000.\n  - minimum - (Required) The minimum number of instances for this resource. Valid values are between 0 and 1000.\n- rules - (Optional) One or more (up to 10) rule blocks as defined below.\n  - metric_trigger - (Required) A metric_trigger block as defined below.\n    - metric_name - (Required) The name of the metric that defines what the rule monitors, such as Percentage CPU for Virtual Machine Scale Sets and CpuPercentage for App Service Plan.\n    - metric_resource_id - (Optional) The ID of the Resource which the Rule monitors.\n    - operator - (Required) Specifies the operator used to compare the metric data and threshold. Possible values are: Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan, LessThanOrEqual.\n    - statistic - (Required) Specifies how the metrics from multiple instances are combined. Possible values are Average, Max, Min and Sum.\n    - time_aggregation - (Required) Specifies how the data that's collected should be combined over time. Possible values include Average, Count, Maximum, Minimum, Last and Total.\n    - time_grain - (Required) Specifies the granularity of metrics that the rule monitors, which must be one of the pre-defined values returned from the metric definitions for the metric. This value must be between 1 minute and 12 hours an be formatted as an ISO 8601 string.\n    - time_window - (Required) Specifies the time range for which data is collected, which must be greater than the delay in metric collection (which varies from resource to resource). This value must be between 5 minutes and 12 hours and be formatted as an ISO 8601 string.\n    - threshold - (Required) Specifies the threshold of the metric that triggers the scale action.\n    - metric_namespace - (Optional) The namespace of the metric that defines what the rule monitors, such as microsoft.compute/virtualmachinescalesets for Virtual Machine Scale Sets.\n    - dimensions - (Optional) One or more dimensions block as defined below.\n      - name - (Required) The name of the dimension.\n      - operator - (Required) The dimension operator. Possible values are Equals and NotEquals. Equals means being equal to any of the values. NotEquals means being not equal to any of the values.\n      - values - (Required) A list of dimension values.\n    - divide_by_instance_count - (Optional) Whether to enable metric divide by instance count.\n  - scale_action - (Required) A scale_action block as defined below.\n    - cooldown - (Required) The amount of time to wait since the last scaling action before this action occurs. Must be between 1 minute and 1 week and formatted as a ISO 8601 string.\n    - direction - (Required) The scale direction. Possible values are Increase and Decrease.\n    - type - (Required) The type of action that should occur. Possible values are ChangeCount, ExactCount, PercentChangeCount and ServiceAllowedNextValue.\n    - value - (Required) The number of instances involved in the scaling action.\n- fixed_date - (Optional) A fixed_date block as defined below. This cannot be specified if a recurrence block is specified.\n  - end - (Required) Specifies the end date for the profile, formatted as an RFC3339 date string.\n  - start - (Required) Specifies the start date for the profile, formatted as an RFC3339 date string.\n  - timezone - (Optional) The Time Zone of the start and end times. Defaults to UTC.\n- recurrence - (Optional) A recurrence block as defined below. This cannot be specified if a fixed_date block is specified.\n  - timezone - (Optional) The Time Zone used for the hours field. Defaults to UTC.\n  - days - (Required) A list of days that this profile takes effect on. Possible values include Monday, Tuesday, Wednesday, Thursday, Friday, Saturday and Sunday.\n  - hours - (Required) A list containing a single item, which specifies the Hour interval at which this recurrence should be triggered (in 24-hour time). Possible values are from 0 to 23.\n  - minutes - (Required) A list containing a single item which specifies the Minute interval at which this recurrence should be triggered.\n"
  type = map(object({
    name = string
    capacity = object({
      default = number
      maximum = number
      minimum = number
    })
    rules = optional(map(object({
      metric_trigger = object({
        metric_name        = string
        metric_resource_id = optional(string)
        operator           = string
        statistic          = string
        time_aggregation   = string
        time_grain         = string
        time_window        = string
        threshold          = number
        metric_namespace   = optional(string)
        dimensions = optional(map(object({
          name     = string
          operator = string
          values   = list(string)
        })))
        divide_by_instance_count = optional(bool)
      })
      scale_action = object({
        cooldown  = string
        direction = string
        type      = string
        value     = string
      })
    })))
    fixed_date = optional(object({
      end      = string
      start    = string
      timezone = optional(string, "UTC")
    }))
    recurrence = optional(object({
      timezone = optional(string, "UTC")
      days     = list(string)
      hours    = list(number)
      minutes  = list(number)
    }))
  }))
  default = ""
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group in the AutoScale Setting should be created. Changing this forces a new resource to be created.\n"
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "target_resource_id" {
  description = "(Required) Specifies the resource ID of the resource that the autoscale setting should be added to. Changing this forces a new resource to be created.\n"
  type        = string
  default     = ""
}
