variable "a_records" {
  description = "A map of objects where each object contains information to create a A record."
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    target_resource_id  = optional(string)
    tags                = optional(map(string), null)
  }))
  default = {}
}

variable "aaaa_records" {
  description = "A map of objects where each object contains information to create a AAAA record."
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    target_resource_id  = optional(string)
    tags                = optional(map(string), null)
  }))
  default = {}
}

variable "caa_records" {
  description = "A map of objects where each object contains information to create a CAA record."
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    record = map(object({
      flags = string
      tag   = string
      value = string
    }))
    tags = optional(map(string), null)
  }))
  default = {}
}

variable "cname_records" {
  description = "A map of objects where each object contains information to create a CNAME record."
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    record              = string
    tags                = optional(map(string), null)
    target_resource_id  = optional(string)
  }))
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "mx_records" {
  description = "A map of objects where each object contains information to create a MX record."
  type = map(object({
    name                = optional(string, "@")
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      preference = number
      exchange   = string
    }))
    tags = optional(map(string), null)
  }))
  default = {}
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "ns_records" {
  description = "A map of objects where each object contains information to create a NS record."
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
  default = {}
}

variable "ptr_records" {
  description = "A map of objects where each object contains information to create a PTR record."
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
  default = {}
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "srv_records" {
  description = "A map of objects where each object contains information to create a SRV record."
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      priority = number
      weight   = number
      port     = number
      target   = string
    }))
    tags = optional(map(string), null)
  }))
  default = {}
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "txt_records" {
  description = "A map of objects where each object contains information to create a TXT record."
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      value = string
    }))
    tags = optional(map(string), null)
  }))
  default = {}
}
