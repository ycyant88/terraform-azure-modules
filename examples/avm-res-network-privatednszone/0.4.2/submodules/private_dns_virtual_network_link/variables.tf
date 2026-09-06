variable "name" {
  description = "The name of the virtual network link."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The ID of the parent resource to which this virtual network link belongs."
  type        = string
  default     = ""
}

variable "private_dns_zone_supports_private_link" {
  description = "Indicates whether the private DNS zone supports private link."
  type        = bool
  default     = false
}

variable "registration_enabled" {
  description = "Indicates whether the virtual network link allows automatic registration of virtual machine DNS records in the private DNS zone."
  type        = bool
  default     = false
}

variable "resolution_policy" {
  description = "The Azure private link zone resolution policy for the virtual network link. Possible values are 'Default' or 'NxDomainRedirect'. If the private DNS zone is not an Azure private link zone (e.g. privatelink.blob.core.windows.net), this value is ignored."
  type        = string
  default     = "Default"
}

variable "retry" {
  description = "Retry configuration for the resource operations"
  type = object({
    error_message_regex  = optional(list(string), ["ReferencedResourceNotProvisioned", "CannotDeleteResource"])
    interval_seconds     = optional(number, 10)
    max_interval_seconds = optional(number, 180)
    multiplier           = optional(number, 1.5)
    randomization_factor = optional(number, 0.5)
  })
  default = {}
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "Custom timeouts for the virtual network link operations."
  type = object({
    create = optional(string, "10m")
    update = optional(string, "10m")
    read   = optional(string, "10m")
    delete = optional(string, "10m")
  })
  default = { "create" : "10m", "delete" : "10m", "read" : "10m", "update" : "10m" }
}

variable "virtual_network_id" {
  description = "The ID of the virtual network to link to the private DNS zone."
  type        = string
  default     = ""
}
