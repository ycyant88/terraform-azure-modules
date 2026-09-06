variable "home_directory" {
  description = "(Optional) The home directory of the storage account local user. Defaults to null."
  type        = string
  default     = null
}

variable "name" {
  description = "(Required) The name of the local user."
  type        = string
  default     = ""
}

variable "permission_scope" {
  description = "(Optional) A list of permission scopes for the local user. Defaults to null (no scopes). Each entry supports:\n\n- resource_name - (Required) The container name (when service is set to blob) or the file share name (when service is set to file).\n- service - (Required) The storage service used by this Storage Account Local User. Possible values are blob and file.\n- permissions - (Required) An object describing the permissions granted at this scope. Supports:\n  - create - (Optional) Whether the local user has the create permission for this scope. Defaults to null (false).\n  - delete - (Optional) Whether the local user has the delete permission for this scope. Defaults to null (false).\n  - list - (Optional) Whether the local user has the list permission for this scope. Defaults to null (false).\n  - read - (Optional) Whether the local user has the read permission for this scope. Defaults to null (false).\n  - write - (Optional) Whether the local user has the write permission for this scope. Defaults to null (false).\n"
  type = list(object({
    resource_name = string
    service       = string
    permissions = object({
      create = optional(bool)
      delete = optional(bool)
      list   = optional(bool)
      read   = optional(bool)
      write  = optional(bool)
    })
  }))
  default = null
}

variable "resource_type" {
  description = "(Optional) Override the AzAPI <provider>/<resource>@<api-version> string used to manage the local user. Defaults to the value tested with this module version."
  type        = string
  default     = "Microsoft.Storage/storageAccounts/localUsers@2025-06-01"
}

variable "retry" {
  description = "(Optional) Retry configuration applied to the AzAPI resource. Defaults to null (no custom retry).\n\n- error_message_regex - (Optional) A list of regex patterns matching error messages that trigger a retry. Defaults to null.\n- interval_seconds - (Optional) Initial interval between retries in seconds. Defaults to null (provider default).\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds. Defaults to null (provider default).\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "ssh_authorized_key" {
  description = "(Optional) A list of SSH authorized keys for the local user. Defaults to null (no keys). Each entry supports:\n\n- key - (Required) The public key value of this SSH authorized key.\n- description - (Optional) The description of this SSH authorized key. Defaults to null.\n"
  type = list(object({
    description = optional(string)
    key         = string
  }))
  default = null
}

variable "ssh_key_enabled" {
  description = "(Optional) Whether SSH key authentication is enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "ssh_password_enabled" {
  description = "(Optional) Whether SSH password authentication is enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "storage_account_id" {
  description = "(Required) The full resource ID of the parent storage account."
  type        = string
  default     = ""
}

variable "timeouts" {
  description = "(Optional) Per-operation timeouts applied to the AzAPI resource. Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n\n- create - (Optional) Timeout for create operations. Defaults to null.\n- read - (Optional) Timeout for read operations. Defaults to null.\n- update - (Optional) Timeout for update operations. Defaults to null.\n- delete - (Optional) Timeout for delete operations. Defaults to null.\n"
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
