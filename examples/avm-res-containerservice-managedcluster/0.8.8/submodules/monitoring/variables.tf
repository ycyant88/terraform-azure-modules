variable "aks_cluster_id" {
  description = "The resource ID of the AKS cluster"
  type        = string
  default     = ""
}

variable "ignore_body_changes" {
  description = "Body-relative paths to ignore for each AzAPI resource, in dot notation. Changes take\neffect only after apply, and ignored configuration is not sent to Azure until the\npath is removed.\n\n- alertsmanagement_prometheus_rule_groups - Paths ignored on the Prometheus rule groups.\n- insights_data_collection_endpoints - Paths ignored on the data collection endpoint.\n- insights_data_collection_rule_associations - Paths ignored on the data collection rule associations.\n- insights_data_collection_rules - Paths ignored on the data collection rules.\n"
  type = object({
    alertsmanagement_prometheus_rule_groups    = optional(list(string), [])
    insights_data_collection_endpoints         = optional(list(string), [])
    insights_data_collection_rule_associations = optional(list(string), [])
    insights_data_collection_rules             = optional(list(string), [])
  })
  default = {}
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = ""
}

variable "log_analytics_workspace_id" {
  description = "The resource ID of the Log Analytics workspace"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The resource ID of the parent resource group"
  type        = string
  default     = ""
}

variable "prometheus_workspace_id" {
  description = "The resource ID of the Azure Monitor workspace for managed Prometheus"
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by this module.\n\n- alertsmanagement_prometheus_rule_groups - Resource type and API version for the Prometheus rule groups.\n- insights_data_collection_endpoints - Resource type and API version for the data collection endpoint.\n- insights_data_collection_rule_associations - Resource type and API version for the data collection rule associations.\n- insights_data_collection_rules - Resource type and API version for the data collection rules.\n"
  type = object({
    alertsmanagement_prometheus_rule_groups    = optional(string, "Microsoft.AlertsManagement/prometheusRuleGroups@2023-03-01")
    insights_data_collection_endpoints         = optional(string, "Microsoft.Insights/dataCollectionEndpoints@2023-03-11")
    insights_data_collection_rule_associations = optional(string, "Microsoft.Insights/dataCollectionRuleAssociations@2023-03-11")
    insights_data_collection_rules             = optional(string, "Microsoft.Insights/dataCollectionRules@2023-03-11")
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
