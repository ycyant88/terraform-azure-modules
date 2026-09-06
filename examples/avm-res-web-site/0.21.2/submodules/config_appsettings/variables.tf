variable "app_settings" {
  description = "A map of key-value pairs for App Settings and custom values to assign to the App Service."
  type        = map(string)
  default     = ""
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
