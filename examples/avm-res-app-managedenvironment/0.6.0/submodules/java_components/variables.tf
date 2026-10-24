variable "component_type" {
  description = "The componentType of the resource.\n"
  type        = string
  default     = ""
}

variable "configurations" {
  description = "List of Java Components configuration properties\n"
  type = list(object({
    property_name = optional(string)
    value         = optional(string)
  }))
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "Paths in the resource's body whose changes the AzAPI provider ignores. Prefer Terraform's lifecycle.ignore_changes when the paths are static; use this variable when the paths must be derived from variables or other non-static values.\n\nPaths use dot notation, for example properties.sku.name. Individual list items cannot be targeted \u2014 ignore the whole list property instead. Configuration changes at an ignored path are **not** sent to Azure until that path is removed from the list.\n\nSupplying a non-empty value requires Terraform 1.11 or later, because ignore_body_changes is a write-only argument. Changes take effect only after an apply, because the value is held in provider-private state.\n\n- app_managed_environments_java_components - Ignored body paths for the Java component.\n"
  type = object({
    app_managed_environments_java_components = optional(list(string), [])
  })
  default = {}
}

variable "ingress" {
  description = "Java Component Ingress configurations.\n\n\n"
  type        = object({})
  default     = null
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = ""
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

variable "resource_types" {
  description = "Override the AzAPI <provider>/<resource>@<api-version> string used by this module. The key defaults to a tested value. Useful when targeting a sovereign cloud with older API versions, or when opting into a newer preview API.\n\n- app_managed_environments_java_components - The Java component.\n"
  type = object({
    app_managed_environments_java_components = optional(string, "Microsoft.App/managedEnvironments/javaComponents@2025-10-02-preview")
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

variable "scale" {
  description = "Java component scaling configurations\n\n- max_replicas - Optional. Maximum number of Java component replicas\n- min_replicas - Optional. Minimum number of Java component replicas. Defaults to 1 if not set\n\n"
  type = object({
    max_replicas = optional(number)
    min_replicas = optional(number)
  })
  default = null
}

variable "service_binds" {
  description = "List of Java Components that are bound to the Java component\n"
  type = list(object({
    name       = optional(string)
    service_id = optional(string)
  }))
  default = null
}

variable "spring_cloud_gateway_routes" {
  description = "Gateway route definition.\n\n- filters - List of gateway filters to apply.\n- id - ID for the route.\n- order - Ordering of the route.\n- predicates - List of predicates to match.\n- uri - URI of the route.\n"
  type = list(object({
    filters    = optional(list(string))
    id         = string
    order      = optional(number)
    predicates = optional(list(string))
    uri        = string
  }))
  default = null
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
