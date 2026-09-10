variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = null
}

variable "container_cpu" {
  description = "CPU value for the container"
  type        = number
  default     = 2
}

variable "container_cpu_limit" {
  description = "CPU limit for the container"
  type        = number
  default     = 2
}

variable "container_image" {
  description = "Image of the container"
  type        = string
  default     = ""
}

variable "container_instance_name" {
  description = "Name of the container instance"
  type        = string
  default     = ""
}

variable "container_memory" {
  description = "Memory value for the container"
  type        = number
  default     = 4
}

variable "container_memory_limit" {
  description = "Memory limit for the container"
  type        = number
  default     = 4
}

variable "container_name" {
  description = "Name of the container"
  type        = string
  default     = ""
}

variable "container_registry_login_server" {
  description = "Login server of the container registry"
  type        = string
  default     = ""
}

variable "container_registry_password" {
  description = "Password of the container registry"
  type        = string
  default     = null
}

variable "container_registry_username" {
  description = "Username of the container registry"
  type        = string
  default     = null
}

variable "environment_variables" {
  description = "Environment variables for the container"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The Azure resource id of the parent resource group in which to create the container instance (e.g. /subscriptions/<subscription-id>/resourceGroups/<resource-group-name>)."
  type        = string
  default     = ""
}

variable "retry" {
  description = "Retry configuration for the resource operations."
  type = object({
    error_message_regex  = optional(list(string), ["CannotDeleteResource", "ReferencedResourceNotProvisioned"])
    interval_seconds     = optional(number, 10)
    max_interval_seconds = optional(number, 180)
  })
  default = {}
}

variable "sensitive_environment_variables" {
  description = "Secure environment variables for the container"
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "Per-operation timeouts forwarded to AzAPI resources. When null, the provider defaults are used. Values are Go duration strings such as \"30m\"."
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "use_private_networking" {
  description = "Flag to indicate whether to use private networking"
  type        = bool
  default     = true
}

variable "user_assigned_managed_identity_id" {
  description = "ID of the user-assigned managed identity"
  type        = string
  default     = ""
}
