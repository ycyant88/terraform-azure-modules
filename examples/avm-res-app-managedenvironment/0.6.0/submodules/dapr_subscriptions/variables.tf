variable "bulk_subscribe" {
  description = "Bulk subscription options\n\n- enabled - Enable bulk subscription\n- max_await_duration_ms - Maximum duration in milliseconds to wait before a bulk message is sent to the app.\n- max_messages_count - Maximum number of messages to deliver in a bulk message.\n\n"
  type = object({
    enabled               = optional(bool)
    max_await_duration_ms = optional(number)
    max_messages_count    = optional(number)
  })
  default = null
}

variable "dead_letter_topic" {
  description = "Deadletter topic name\n"
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "Paths in the resource's body whose changes the AzAPI provider ignores. Prefer Terraform's lifecycle.ignore_changes when the paths are static; use this variable when the paths must be derived from variables or other non-static values.\n\nPaths use dot notation, for example properties.sku.name. Individual list items cannot be targeted \u2014 ignore the whole list property instead. Configuration changes at an ignored path are **not** sent to Azure until that path is removed from the list.\n\nSupplying a non-empty value requires Terraform 1.11 or later, because ignore_body_changes is a write-only argument. Changes take effect only after an apply, because the value is held in provider-private state.\n\n- app_managed_environments_dapr_subscriptions - Ignored body paths for the Dapr subscription.\n"
  type = object({
    app_managed_environments_dapr_subscriptions = optional(list(string), [])
  })
  default = {}
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = ""
}

variable "metadata" {
  description = "Subscription metadata\n"
  type        = map(string)
  default     = null
}

variable "name" {
  description = "The name of the resource.\n"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The resource ID of the Container Apps Managed Environment, for example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rg/providers/Microsoft.App/managedEnvironments/example-env. Changing this forces a new resource to be created.\n"
  type        = string
  default     = ""
}

variable "pubsub_name" {
  description = "Dapr PubSub component name\n"
  type        = string
  default     = null
}

variable "resource_types" {
  description = "Override the AzAPI <provider>/<resource>@<api-version> string used by this module. The key defaults to a tested value. Useful when targeting a sovereign cloud with older API versions, or when opting into a newer preview API.\n\n- app_managed_environments_dapr_subscriptions - The Dapr subscription.\n"
  type = object({
    app_managed_environments_dapr_subscriptions = optional(string, "Microsoft.App/managedEnvironments/daprSubscriptions@2025-10-02-preview")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to every azapi resource managed by the module. By default the module retries ContainerAppEnvironmentDisabled, which the control plane returns until an environment that has scaled to zero finishes waking. Consumers **MAY** override any field.\n\n- error_message_regex  - (Optional) A list of regex patterns matching error messages that trigger a retry. Defaults to [\"ContainerAppEnvironmentDisabled\"].\n- interval_seconds     - (Optional) Initial interval between retries in seconds.\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds.\n\nSee <https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource#retry> for full semantics.\n"
  type = object({
    error_message_regex  = optional(list(string), ["ContainerAppEnvironmentDisabled"])
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = {}
}

variable "routes" {
  description = "Subscription routes\n\n- default - The default path to deliver events that do not match any of the rules.\n- rules - The list of Dapr PubSub Event Subscription Route Rules.\n\n"
  type = object({
    default = optional(string)
    rules = optional(list(object({
      match = optional(string)
      path  = optional(string)
    })))
  })
  default = null
}

variable "scopes" {
  description = "Application scopes to restrict the subscription to specific apps.\n"
  type        = list(string)
  default     = null
}

variable "timeouts" {
  description = "Default per-operation timeouts applied to every azapi resource managed by the module. Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n\n- create - (Optional) Timeout for create operations.\n- read   - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n- delete - (Optional) Timeout for delete operations.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}

variable "topic" {
  description = "Topic name\n"
  type        = string
  default     = null
}
