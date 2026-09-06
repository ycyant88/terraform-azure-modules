variable "retry" {
  description = "(Optional) Retry configuration applied to every AzAPI resource managed by this module. Defaults to null (no custom retry). See AzAPI provider docs for details.\n\n- error_message_regex - (Optional) A list of regex patterns matching error messages that trigger a retry. Defaults to null.\n- interval_seconds - (Optional) Initial interval between retries in seconds. Defaults to null (provider default).\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds. Defaults to null (provider default).\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "role_assignment_definition_lookup_enabled" {
  description = "(Optional) Whether the Azure/avm-utl-interfaces/azure module should resolve role definition names supplied via role_definition_id_or_name by querying the Azure Authorization API. Defaults to true. Set to false if you only ever supply fully-qualified role definition resource IDs and want to skip the lookup (for example to avoid the API call in air-gapped or permission-restricted environments)."
  type        = bool
  default     = true
}

variable "role_assignments" {
  description = "(Optional) A map of role assignments to create at the supplied scope. Defaults to {} (no role assignments). The map key is deliberate so that consumers can manage these resources predictably. Each value supports:\n\n- role_definition_id_or_name - (Required) Either the full resource ID of the role definition (/subscriptions/<sub>/providers/Microsoft.Authorization/roleDefinitions/<id>) or the role name (e.g. Storage Blob Data Owner).\n- principal_id - (Required) The principal id to assign the role to.\n- description - (Optional) Description of the role assignment. Defaults to null.\n- skip_service_principal_aad_check - (Optional) Retained for backwards compatibility. Not honoured by AzAPI; left here so the variable shape matches the upstream module. Defaults to false.\n- condition - (Optional) Conditional access expression. Defaults to null.\n- condition_version - (Optional) Conditional access expression version. Required when condition is supplied. Defaults to null.\n- delegated_managed_identity_resource_id - (Optional) The resource ID of the delegated managed identity. Defaults to null.\n- principal_type - (Optional) The type of principal. Possible values are User, Group, ServicePrincipal, ForeignGroup, and Device. Defaults to null.\n"
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

variable "scope" {
  description = "(Required) The fully-qualified Azure resource ID at which the role assignments should be created (the parent_id for the roleAssignment resource)."
  type        = string
  default     = ""
}

variable "timeouts" {
  description = "(Optional) Per-operation timeouts applied to every AzAPI resource managed by this module. Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n\n- create - (Optional) Timeout for create operations. Defaults to null.\n- read - (Optional) Timeout for read operations. Defaults to null.\n- update - (Optional) Timeout for update operations. Defaults to null.\n- delete - (Optional) Timeout for delete operations. Defaults to null.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}

variable "tracing_tags_header" {
  description = "(Optional) User-Agent string injected as the User-Agent request header for all AzAPI requests. Pass local.avm_azapi_header from the calling module. Defaults to null (no custom header)."
  type        = string
  default     = null
}
