variable "body" {
  description = "The body object of the resource."
  type        = any
  default     = ""
}

variable "identity" {
  description = "  Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n  - type - Either: SystemAssigned, SystemAssigned, UserAssigned, or UserAssigned.\n  - user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    type         = string
    identity_ids = optional(set(string), [])
  })
  default = null
}

variable "ignore_missing_property" {
  description = "If set to true, the resource will not be replaced if a property is missing."
  type        = bool
  default     = false
}

variable "location" {
  description = "Location of the resource."
  type        = string
  default     = null
}

variable "name" {
  description = "The name of resource."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The parent ID of the resource."
  type        = string
  default     = ""
}

variable "replace_triggered_by" {
  description = "Values that trigger a replacement."
  type        = any
  default     = null
}

variable "response_export_values" {
  description = "List of values to export from the response, made available in the output."
  type        = set(string)
  default     = null
}

variable "timeouts" {
  description = "  A map of timeouts to apply to the creation and destruction of the resource.\n"
  type = object({
    create = string
    delete = string
    update = string
    read   = string
  })
  default = { "create" : "10m", "delete" : "10m", "read" : "10m", "update" : "10m" }
}

variable "type" {
  description = "The type and API version of the resource."
  type        = string
  default     = ""
}
