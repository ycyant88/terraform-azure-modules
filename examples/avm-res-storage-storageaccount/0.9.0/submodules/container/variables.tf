variable "default_encryption_scope" {
  description = "(Optional) The default encryption scope to use for blob operations on the container. Defaults to null (the storage account default encryption scope is used)."
  type        = string
  default     = null
}

variable "deny_encryption_scope_override" {
  description = "(Optional) When set to true, blocks blob uploads from specifying a different encryption scope. Defaults to null (false)."
  type        = bool
  default     = null
}

variable "enable_nfs_v3_all_squash" {
  description = "(Optional) Enable NFSv3 all squash (only valid for NFSv3 enabled accounts). Defaults to null (false)."
  type        = bool
  default     = null
}

variable "enable_nfs_v3_root_squash" {
  description = "(Optional) Enable NFSv3 root squash (only valid for NFSv3 enabled accounts). Defaults to null (false)."
  type        = bool
  default     = null
}

variable "immutable_storage_with_versioning" {
  description = "(Optional) Configures container-level immutability with version-level WORM. Defaults to null (immutability disabled).\n\n- enabled - (Required) Whether immutable storage with versioning is enabled.\n"
  type = object({
    enabled = bool
  })
  default = null
}

variable "metadata" {
  description = "(Optional) Container metadata. Keys must be lowercase. Defaults to null (no metadata)."
  type        = map(string)
  default     = null
}

variable "name" {
  description = "(Required) The name of the container."
  type        = string
  default     = ""
}

variable "public_access" {
  description = "(Optional) Specifies the level of public access. Valid values: None, Blob, Container. Defaults to None."
  type        = string
  default     = "None"
}

variable "resource_type" {
  description = "(Optional) Override the AzAPI <provider>/<resource>@<api-version> string used to manage the blob container. Defaults to the value tested with this module version."
  type        = string
  default     = "Microsoft.Storage/storageAccounts/blobServices/containers@2025-06-01"
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
  description = "(Optional) A map of role assignments to create at the container scope. Defaults to {}. See the role_assignments submodule for the attribute schema."
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
