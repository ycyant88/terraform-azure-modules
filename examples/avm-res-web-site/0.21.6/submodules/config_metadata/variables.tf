variable "is_slot" {
  description = "Whether the parent resource is a deployment slot. Defaults to false."
  type        = bool
  default     = false
}

variable "metadata" {
  description = "A map of key-value pairs for site metadata (e.g. CURRENT_STACK)."
  type        = map(string)
  default     = ""
}

variable "parent_id" {
  description = "The resource ID of the App Service site or slot."
  type        = string
  default     = ""
}
