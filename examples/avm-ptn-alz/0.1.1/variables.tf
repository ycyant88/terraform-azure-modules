variable "base_archetype" {
  description = "The archetype of the management group.\nThis should be one of the built in archetypes, or a custom one defined in one of the lib_dirs.\n"
  type        = string
  default     = ""
}

variable "default_location" {
  description = "The default location for resources in this management group. Used for policy managed identities.\n"
  type        = string
  default     = ""
}

variable "default_log_analytics_workspace_id" {
  description = ""
  type        = string
  default     = null
}

variable "display_name" {
  description = "The display name of the management group.\n"
  type        = string
  default     = ""
}

variable "id" {
  description = "The id of the management group. This must be unique and cannot be changed after creation.\n"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The id of the parent management group. Use the tenant id to create a child of the tenant root group.\nThe azurerm_client_config data source from the AzureRM provider is useful to get the tenant id.\n"
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = ""
  type = map(object({
    role_definition_id   = optional(string, "")
    role_definition_name = optional(string, "")
    principal_id         = string
    description          = optional(string, null)
  }))
  default = {}
}
