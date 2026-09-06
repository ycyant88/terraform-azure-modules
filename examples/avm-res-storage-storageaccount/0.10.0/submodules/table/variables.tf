variable "name" {
  description = "(Required) The name of the table."
  type        = string
  default     = ""
}

variable "resource_type" {
  description = "(Optional) Override the AzAPI <provider>/<resource>@<api-version> string used to manage the table. Defaults to the value tested with this module version."
  type        = string
  default     = "Microsoft.Storage/storageAccounts/tableServices/tables@2025-06-01"
}

variable "retry" {
  description = "(Optional) Retry configuration applied to AzAPI resources managed by this module. Defaults to null (no custom retry).\n\n- error_message_regex - (Optional) A list of regex patterns matching error messages that trigger a retry. Defaults to null.\n- interval_seconds - (Optional) Initial interval between retries in seconds. Defaults to null (provider default).\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds. Defaults to null (provider default).\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "role_assignment_definition_lookup_enabled" {
  description = "(Optional) Whether the role_assignments submodule should resolve role definition names supplied via role_definition_id_or_name by querying the Azure Authorization API. Defaults to true. See the role_assignments submodule for details."
  type        = bool
  default     = true
}

variable "role_assignments" {
  description = "(Optional) A map of role assignments to create at the table scope. Defaults to {}. See the role_assignments submodule for the attribute schema."
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

variable "signed_identifiers" {
  description = "(Optional) Signed identifiers / stored access policies for the table. Defaults to null (no signed identifiers). A maximum of 5 signed identifiers may be defined. Each entry supports:\n\n- id - (Required) The ID for this signed identifier (1-64 characters).\n- access_policy - (Optional) The access policy for this signed identifier. Defaults to null. Supports:\n  - expiry_time - (Required) The ISO-8601 UTC time at which the access policy expires.\n  - permission - (Required) The permissions granted by the access policy. Possible values include any combination of r (read), a (add), u (update), and d (delete).\n  - start_time - (Required) The ISO-8601 UTC time at which the access policy becomes valid.\n"
  type = list(object({
    id = string
    access_policy = optional(object({
      expiry_time = string
      permission  = string
      start_time  = string
    }))
  }))
  default = null
}

variable "storage_account_id" {
  description = "(Required) The full resource ID of the parent storage account."
  type        = string
  default     = ""
}

variable "timeouts" {
  description = "(Optional) Per-operation timeouts applied to AzAPI resources managed by this module. Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n\n- create - (Optional) Timeout for create operations. Defaults to null.\n- read - (Optional) Timeout for read operations. Defaults to null.\n- update - (Optional) Timeout for update operations. Defaults to null.\n- delete - (Optional) Timeout for delete operations. Defaults to null.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}

variable "tracing_tags_header" {
  description = "(Optional) User-Agent string injected into AzAPI request headers. Defaults to null (no custom header)."
  type        = string
  default     = null
}
