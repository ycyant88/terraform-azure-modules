variable "certificate_key_vault_properties" {
  description = "Properties for a certificate stored in a Key Vault.\n\n- identity - Resource ID of a managed identity to authenticate with Azure Key Vault, or System to use a system-assigned identity.\n- key_vault_url - URL pointing to the Azure Key Vault secret that holds the certificate.\n\n"
  type = object({
    identity      = optional(string)
    key_vault_url = optional(string)
  })
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "Paths in the resource's body whose changes the AzAPI provider ignores. Prefer Terraform's lifecycle.ignore_changes when the paths are static; use this variable when the paths must be derived from variables or other non-static values.\n\nPaths use dot notation, for example properties.sku.name. Individual list items cannot be targeted \u2014 ignore the whole list property instead. Configuration changes at an ignored path are **not** sent to Azure until that path is removed from the list.\n\nSupplying a non-empty value requires Terraform 1.11 or later, because ignore_body_changes is a write-only argument. Changes take effect only after an apply, because the value is held in provider-private state.\n\n- app_managed_environments_certificates - Ignored body paths for the certificate.\n"
  type = object({
    app_managed_environments_certificates = optional(list(string), [])
  })
  default = {}
}

variable "location" {
  description = "The location of the resource.\n"
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

variable "password" {
  description = "Certificate password.\n"
  type        = string
  default     = null
}

variable "password_version" {
  description = "Version tracker for password. Must be set when password is provided.\n"
  type        = number
  default     = null
}

variable "resource_types" {
  description = "Override the AzAPI <provider>/<resource>@<api-version> string used by this module. The key defaults to a tested value. Useful when targeting a sovereign cloud with older API versions, or when opting into a newer preview API.\n\n- app_managed_environments_certificates - The certificate.\n"
  type = object({
    app_managed_environments_certificates = optional(string, "Microsoft.App/managedEnvironments/certificates@2025-10-02-preview")
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

variable "tags" {
  description = "(Optional) Tags of the resource.\n"
  type        = map(string)
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

variable "value" {
  description = "PFX or PEM blob\n"
  type        = any
  default     = null
}

variable "value_version" {
  description = "Version tracker for value. Must be set when value is provided.\n"
  type        = number
  default     = null
}
