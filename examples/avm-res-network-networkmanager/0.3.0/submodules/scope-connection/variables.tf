variable "description" {
  description = "  (Optional) The description of the Scope Connection.\n"
  type        = string
  default     = ""
}

variable "name" {
  description = "  (Required) The name of the Scope Connection. The name must be between 1 and 64 characters, and can contain letters, numbers, underscores, periods, and hyphens. The name must start with a letter or a number, and end with a letter, a number, or an underscore.\n"
  type        = string
  default     = ""
}

variable "network_manager_id" {
  description = "  (Required) The ID of the Network Manager to which this Scope Connection belongs.\n"
  type        = string
  default     = ""
}

variable "resource_id" {
  description = "  (Required) The ID of the Subscription or Management Group to which the Network Manager will connect.\n"
  type        = string
  default     = ""
}

variable "tenant_id" {
  description = "  (Required) The tenant ID of the Subscription or Management Group to which the Network Manager will connect.\n"
  type        = string
  default     = ""
}
