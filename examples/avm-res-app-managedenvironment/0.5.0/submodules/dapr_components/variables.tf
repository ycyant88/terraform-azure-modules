variable "component_type" {
  description = "Component type\n"
  type        = string
  default     = null
}

variable "dapr_components_version" {
  description = "Component version\n"
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.\n"
  type        = bool
  default     = true
}

variable "ignore_errors" {
  description = "Boolean describing if the component errors are ignores\n"
  type        = bool
  default     = null
}

variable "init_timeout" {
  description = "Initialization timeout\n"
  type        = string
  default     = null
}

variable "metadata" {
  description = "Component metadata\n"
  type = list(object({
    name       = optional(string)
    secret_ref = optional(string)
    value      = optional(string)
  }))
  default = null
}

variable "name" {
  description = "The name of the resource.\n"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The parent resource ID for this resource.\n"
  type        = string
  default     = ""
}

variable "scopes" {
  description = "Names of container apps that can use this Dapr component\n"
  type        = list(string)
  default     = null
}

variable "secret_store_component" {
  description = "Name of a Dapr component to retrieve component secrets from\n"
  type        = string
  default     = null
}

variable "secrets" {
  description = "Collection of secrets used by a Dapr component\n"
  type = list(object({
    identity      = optional(string)
    key_vault_url = optional(string)
    name          = optional(string)
    value         = optional(string)
  }))
  default = null
}

variable "secrets_version" {
  description = "Version tracker for secrets. Must be set when secrets is provided.\n"
  type        = number
  default     = null
}

variable "service_component_bind" {
  description = "List of container app services that are bound to the Dapr component.\n\n- metadata - Optional. Metadata for the service bind.\n  - name - Optional. Name of the metadata item.\n  - value - Optional. Value of the metadata item.\n- name - Optional. Name of the service bind.\n- service_id - Optional. Service ID to bind to.\n"
  type = list(object({
    metadata = optional(object({
      name  = optional(string)
      value = optional(string)
    }))
    name       = optional(string)
    service_id = optional(string)
  }))
  default = null
}
