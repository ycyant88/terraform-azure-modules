variable "aks_cluster_id" {
  description = "The resource ID of the AKS cluster"
  type        = string
  default     = ""
}

variable "alert_email" {
  description = "Email address for alert notifications"
  type        = string
  default     = ""
}

variable "ignore_body_changes" {
  description = "Body-relative paths to ignore for each AzAPI resource, in dot notation. Changes take\neffect only after apply, and ignored configuration is not sent to Azure until the\npath is removed.\n\n- insights_action_groups - Paths ignored on the action group.\n- insights_metric_alerts - Paths ignored on the metric alerts.\n"
  type = object({
    insights_action_groups = optional(list(string), [])
    insights_metric_alerts = optional(list(string), [])
  })
  default = {}
}

variable "parent_id" {
  description = "The parent resource group ID"
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by this module.\n\n- insights_action_groups - Resource type and API version for the action group.\n- insights_metric_alerts - Resource type and API version for the metric alerts.\n"
  type = object({
    insights_action_groups = optional(string, "Microsoft.Insights/actionGroups@2024-10-01-preview")
    insights_metric_alerts = optional(string, "Microsoft.Insights/metricAlerts@2018-03-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to the AzAPI resources in this module.\n\n- error_message_regex - Regular expressions matching error messages that should be retried.\n- interval_seconds - Initial delay between retries, in seconds.\n- max_interval_seconds - Maximum delay between retries, in seconds.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "Timeouts applied to the AzAPI resources in this module.\n\n- create - Timeout for create operations.\n- read - Timeout for read operations.\n- update - Timeout for update operations.\n- delete - Timeout for delete operations.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
