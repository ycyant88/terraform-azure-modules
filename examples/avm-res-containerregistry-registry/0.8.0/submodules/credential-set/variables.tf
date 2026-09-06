variable "auth_credentials" {
  description = "A list of authentication credentials the credential set stores for the upstream registry. Usually a single primary credential.\n\n- name - (Optional) The name of the credential. Defaults to Credential1 (the only value currently supported by Azure).\n- username_secret_identifier - (Required) The Key Vault secret URI that holds the upstream registry username.\n- password_secret_identifier - (Required) The Key Vault secret URI that holds the upstream registry password.\n\nThe system-assigned managed identity of this credential set (exposed via the principal_id output) must be granted read access to the referenced Key Vault secrets (for example the Key Vault Secrets User role).\n"
  type = list(object({
    name                       = optional(string, "Credential1")
    username_secret_identifier = string
    password_secret_identifier = string
  }))
  default = ""
}

variable "login_server" {
  description = "The login server of the upstream registry the credentials authenticate to (e.g. docker.io for Docker Hub). Changing this value replaces the credential set, creates a new principal_id, and requires the caller to update any Key Vault role assignment for that identity."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the credential set. Must be 5-50 characters long and can only contain letters, numbers and hyphens."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The fully-qualified ARM resource ID of the Container Registry into which this credential set will be deployed (e.g. /subscriptions/.../resourceGroups/.../providers/Microsoft.ContainerRegistry/registries/myregistry). This submodule **does not** create the parent registry.\n"
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "A map controlling the AzAPI resource type (and API version) used for each azapi_resource this submodule manages.\n\n- this - The Microsoft.ContainerRegistry/registries/credentialSets resource type and API version to use.\n"
  type = object({
    this = optional(string, "Microsoft.ContainerRegistry/registries/credentialSets@2025-11-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to the credential set azapi resource. Defaults to null (no custom retry).\n\n- error_message_regex  - (Optional) Regex patterns matching error messages that trigger a retry.\n- interval_seconds     - (Optional) Initial interval between retries in seconds.\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "timeouts" {
  description = "Per-operation timeouts applied to the credential set azapi resource. Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
