variable "deployment_region" {
  description = "The selected region for deployment"
  type        = string
  default     = ""
}

variable "hibernation_supported" {
  description = "When true, only return sizes that advertise the HibernationSupported capability. Hibernation is limited to a subset of the v5 D and E families, so leave this false unless the example enables hibernation."
  type        = bool
  default     = false
}
