variable "component_type" {
  description = "The type of the Dapr component."
  type        = string
  default     = ""
}

variable "dapr_component_version" {
  description = "The version of the Dapr component."
  type        = string
  default     = null
}

variable "ignore_errors" {
  description = "Whether to ignore errors for the Dapr component."
  type        = bool
  default     = false
}

variable "init_timeout" {
  description = "The initialization timeout for the Dapr component."
  type        = string
  default     = null
}

variable "managed_environment" {
  description = "The Dapr component resource."
  type = object({
    resource_id = string
  })
  default = ""
}

variable "metadata" {
  description = "The metadata for the Dapr component."
  type = list(object({
    name        = string
    secret_name = string
    value       = string
  }))
  default = null
}

variable "name" {
  description = "The name of the Dapr component."
  type        = string
  default     = ""
}

variable "scopes" {
  description = "The scopes for the Dapr component."
  type        = list(string)
  default     = []
}

variable "secret" {
  description = "The secrets for the Dapr component."
  type = set(object({
    # identity            = string
    # key_vault_secret_id = string
    name  = string
    value = string
  }))
  default = null
}

variable "secret_store_component" {
  description = "The secret store component for the Dapr component."
  type        = string
  default     = null
}

variable "timeouts" {
  description = " - create - (Defaults to 30 minutes) Used when creating the Dapr component.\n - delete - (Defaults to 30 minutes) Used when deleting the Dapr component.\n - read - (Defaults to 5 minutes) Used when retrieving the Dapr component.\n - update - (Defaults to 30 minutes) Used when updating the Dapr component.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
