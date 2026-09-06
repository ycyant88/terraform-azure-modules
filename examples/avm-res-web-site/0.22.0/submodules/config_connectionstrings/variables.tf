variable "connection_strings" {
  description = "A map of connection strings to assign to the App Service.\n\n- name - (Optional) The name of the connection string. If not set, the map key is used.\n- type - (Optional) The type of the connection string.\n- value - (Optional) The value of the connection string.\n"
  type = map(object({
    name  = optional(string)
    type  = optional(string)
    value = optional(string)
  }))
  default = ""
}

variable "is_slot" {
  description = "Whether the parent resource is a deployment slot. Defaults to false."
  type        = bool
  default     = false
}

variable "parent_id" {
  description = "The resource ID of the App Service site or slot."
  type        = string
  default     = ""
}

variable "retry" {
  description = "Retry configuration for azapi resources."
  type = object({
    error_message_regex = list(string)
    interval_seconds    = optional(number, 10)
    max_retries         = optional(number, 3)
  })
  default = { "error_message_regex" : ["Cannot modify this site because another operation is in progress"] }
}
