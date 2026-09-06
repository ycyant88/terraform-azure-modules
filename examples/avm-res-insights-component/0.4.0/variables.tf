variable "application_type" {
  description = "(Required) The type of the application. Possible values are 'web', 'ios', 'java', 'phone', 'MobileCenter', 'Node.JS', 'other', 'store'."
  type        = string
  default     = "web"
}

variable "daily_data_cap_in_gb" {
  description = "(Optional) The daily data cap in GB. 0 means unlimited."
  type        = number
  default     = 100
}

variable "daily_data_cap_notifications_disabled" {
  description = "(Optional) Disables the daily data cap notifications."
  type        = bool
  default     = false
}

variable "diagnostic_settings" {
  description = "  A map of diagnostic settings to create on the Application Insights component. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n  - logs - (Optional) A set of log categories or category groups to send to the destination. If both logs and metrics are omitted or empty, the module defaults to enabling allLogs. If logs is provided and metrics is omitted, metrics remain unset.\n  - metrics - (Optional) A set of metric categories to send to the destination. If both logs and metrics are omitted or empty, the module defaults to enabling AllMetrics. If metrics is provided and logs is omitted, logs remain unset. At this resource scope, the only supported metric category is AllMetrics.\n  - log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n  - workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n  - storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n  - event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n  - event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n  - marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic Logs.\n"
  type = map(object({
    name = optional(string, null)
    logs = optional(set(object({
      category       = optional(string, null)
      category_group = optional(string, null)
      enabled        = optional(bool, true)
      retention_policy = optional(object({
        days    = optional(number, 0)
        enabled = optional(bool, false)
      }), {})
    })), [])
    metrics = optional(set(object({
      category = optional(string, null)
      enabled  = optional(bool, true)
      retention_policy = optional(object({
        days    = optional(number, 0)
        enabled = optional(bool, false)
      }), {})
    })), [])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
  default = {}
}

variable "disable_ip_masking" {
  description = "(Optional) Disables IP masking. Defaults to false. For more information see <https://aka.ms/avm/ipmasking>."
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "force_customer_storage_for_profiler" {
  description = "(Optional) Forces customer storage for profiler. Defaults to false."
  type        = bool
  default     = false
}

variable "internet_ingestion_enabled" {
  description = "(Optional) Enables internet ingestion. Defaults to true."
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "(Optional) Enables internet query. Defaults to true."
  type        = bool
  default     = true
}

variable "linked_storage_account" {
  description = "  Linked storage account configuration for the Application Insights profiler.\n\n  - resource_id - The resource ID of the storage account.\n"
  type = map(object({
    resource_id = optional(string, null)
  }))
  default = {}
}

variable "local_authentication_disabled" {
  description = "(Optional) Disables local authentication. Defaults to false."
  type        = bool
  default     = false
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "monitor_private_link_scope" {
  description = "  Monitor private link scope to connect the Application Insights resource to.\n\n  - resource_id - The resource ID of the monitor private link scope.\n  - name - The name of the scoped resource. Defaults to the Application Insights resource name.\n  - kind - The kind of the scoped resource. Defaults to Resource. Possible values are Resource or Metrics.\n  - subscription_location - The location of the subscription. This is required for kind Metrics.\n"
  type = map(object({
    resource_id           = optional(string, null)
    name                  = optional(string, null)
    kind                  = optional(string, "Resource")
    subscription_location = optional(string, null)
  }))
  default = {}
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "retention_in_days" {
  description = "(Optional) The retention period in days. 0 means unlimited."
  type        = number
  default     = 90
}

variable "retry" {
  description = "  The retry configuration for azapi resources. The following properties can be specified:\n\n  - error_message_regex - (Required) A list of regular expressions to match against error messages. If any match, the request will be retried.\n  - interval_seconds - (Optional) The base number of seconds to wait between retries. Default is 10.\n  - max_interval_seconds - (Optional) The maximum number of seconds to wait between retries. Default is 180.\n"
  type = object({
    error_message_regex  = optional(list(string), ["ScopeLocked"])
    interval_seconds     = optional(number, null)
    max_interval_seconds = optional(number, null)
  })
  default = null
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n- delegated_managed_identity_resource_id - The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created.\n- principal_type - The type of the principal_id. Possible values are User, Group and ServicePrincipal. Changing this forces a new resource to be created. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "sampling_percentage" {
  description = "(Optional) The sampling percentage. 100 means all."
  type        = number
  default     = 100
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "  The timeout configuration for azapi resources. The following properties can be specified:\n\n  - create - (Optional) The timeout for create operations e.g. \"30m\", \"1h\".\n  - delete - (Optional) The timeout for delete operations e.g. \"30m\", \"1h\".\n  - read - (Optional) The timeout for read operations e.g. \"30m\", \"1h\".\n  - update - (Optional) The timeout for update operations e.g. \"30m\", \"1h\".\n"
  type = object({
    create = optional(string, null)
    delete = optional(string, null)
    read   = optional(string, null)
    update = optional(string, null)
  })
  default = null
}

variable "workspace_id" {
  description = "(Required) The ID of the Log Analytics workspace to send data to. AzureRm supports classic; however, Azure has deprecated it, thus it's required"
  type        = string
  default     = ""
}
