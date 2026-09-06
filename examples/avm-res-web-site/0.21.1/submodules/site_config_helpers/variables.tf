variable "is_logic_app" {
  description = "Whether the parent app is a Logic App."
  type        = bool
  default     = false
}

variable "managed_identities" {
  description = "Managed identity configuration."
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "os_type" {
  description = "The OS type. Must be Linux or Windows."
  type        = string
  default     = ""
}

variable "site_config" {
  description = "The site configuration object to transform. Uses any type as this is an internal helper; callers validate types."
  type        = any
  default     = {}
}
