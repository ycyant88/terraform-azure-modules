variable "ip_addresses" {
  description = "A set of IP addresses or hostnames for the A record."
  type        = set(string)
  default     = ""
}

variable "name" {
  description = "The name of the dns record."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The ID of the parent resource to which this virtual network link belongs."
  type        = string
  default     = ""
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

variable "timeouts" {
  description = "Custom timeouts for the vdns record operations."
  type = object({
    create = optional(string, "10m")
    update = optional(string, "10m")
    read   = optional(string, "10m")
    delete = optional(string, "10m")
  })
  default = { "create" : "10m", "delete" : "10m", "read" : "10m", "update" : "10m" }
}

variable "ttl" {
  description = "The time to live of the record."
  type        = number
  default     = ""
}
