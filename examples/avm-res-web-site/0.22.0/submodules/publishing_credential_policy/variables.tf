variable "allow" {
  description = "Should basic authentication be allowed for this publishing credential type? Defaults to false."
  type        = bool
  default     = false
}

variable "is_slot" {
  description = "Whether the parent resource is a deployment slot. Defaults to false."
  type        = bool
  default     = false
}

variable "name" {
  description = "The name of the publishing credential policy. Must be ftp or scm."
  type        = string
  default     = ""
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
