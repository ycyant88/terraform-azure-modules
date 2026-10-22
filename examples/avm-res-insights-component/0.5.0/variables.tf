variable "application_type" {
  description = "(Optional) The type of the application. Possible values are 'web', 'ios', 'java', 'phone', 'MobileCenter', 'Node.JS', 'other', 'store'. Changing this replaces the Application Insights component."
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

variable "ignore_body_changes" {
  description = "Paths in each AzAPI resource's body whose changes are ignored, in dot notation relative to the body, for example tags or properties.SamplingPercentage. Individual list items cannot be targeted; ignore the whole list instead. Configuration at an ignored path is not sent to Azure until the path is removed, and a change to this variable takes effect only after the next apply. A non-empty list requires Terraform 1.11 or later.\n\n- authorization_locks - Paths ignored on the management lock.\n- authorization_role_assignments - Paths ignored on the role assignments.\n- insights_components - Paths ignored on the Application Insights component.\n- insights_components_linked_storage_accounts - Paths ignored on the profiler's linked storage account.\n- insights_components_pricing_plans - properties, properties.cap or properties.stopSendNotificationWhenHitCap stop the module managing the daily data cap and its notifications. The daily data cap is managed with azapi_update_resource, which has no ignore_body_changes argument, so these properties are left out of the update instead, and Terraform 1.11 is not required for them.\n- insights_diagnostic_settings - Paths ignored on the diagnostic settings.\n- insights_private_link_scopes_scoped_resources - Paths ignored on the Azure Monitor private link scope connections.\n"
  type = object({
    authorization_locks                           = optional(list(string), [])
    authorization_role_assignments                = optional(list(string), [])
    insights_components                           = optional(list(string), [])
    insights_components_linked_storage_accounts   = optional(list(string), [])
    insights_components_pricing_plans             = optional(list(string), [])
    insights_diagnostic_settings                  = optional(list(string), [])
    insights_private_link_scopes_scoped_resources = optional(list(string), [])
  })
  default = {}
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
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, lock-<name> is used, where <name> is the name of the Application Insights component. Changing this forces the creation of a new resource.\n- notes - (Optional) Notes about the lock. This value maps to Microsoft.Authorization/locks.properties.notes.\n"
  type = object({
    kind  = string
    name  = optional(string, null)
    notes = optional(string, null)
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

variable "parent_id" {
  description = "The resource ID of the existing resource group to deploy the Application Insights component into, for example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rg."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "The AzAPI resource types and API versions the module uses. Override a value to use a different API version, for example in a sovereign cloud.\n\n- authorization_locks - The management lock.\n- authorization_role_assignments - The role assignments.\n- insights_components - The Application Insights component.\n- insights_components_linked_storage_accounts - The profiler's linked storage account. Only a preview API version exists.\n- insights_components_pricing_plans - The pricing plan that holds the daily data cap.\n- insights_diagnostic_settings - The diagnostic settings.\n- insights_private_link_scopes_scoped_resources - The Azure Monitor private link scope connections. The default is a preview API version, because kind and subscriptionLocation are not in a stable one.\n"
  type = object({
    authorization_locks                           = optional(string, "Microsoft.Authorization/locks@2020-05-01")
    authorization_role_assignments                = optional(string, "Microsoft.Authorization/roleAssignments@2022-04-01")
    insights_components                           = optional(string, "Microsoft.Insights/components@2020-02-02")
    insights_components_linked_storage_accounts   = optional(string, "microsoft.insights/components/linkedStorageAccounts@2020-03-01-preview")
    insights_components_pricing_plans             = optional(string, "microsoft.insights/components/pricingPlans@2017-10-01")
    insights_diagnostic_settings                  = optional(string, "Microsoft.Insights/diagnosticSettings@2021-05-01-preview")
    insights_private_link_scopes_scoped_resources = optional(string, "Microsoft.Insights/privateLinkScopes/scopedResources@2023-06-01-preview")
  })
  default = {}
}

variable "retention_in_days" {
  description = "(Optional) The retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 and 730. Defaults to 90."
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
  description = "A map of role assignments to create on the Application Insights component. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the role assignment. If not set, a random UUID will be generated. Changing this forces the creation of a new resource.\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - (Optional) The condition which will be used to scope the role assignment.\n- condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    name                                   = optional(string, null)
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
  description = "(Required) The resource ID of the Log Analytics workspace to send data to. Azure has retired classic Application Insights components, so a workspace is required."
  type        = string
  default     = ""
}
