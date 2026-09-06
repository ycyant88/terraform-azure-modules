variable "a_records" {
  description = "A map of objects where each object contains information to create a A record."
  type = map(object({
    name    = string
    ttl     = number
    records = list(string)
    tags    = optional(map(string), null)
  }))
  default = {}
}

variable "aaaa_records" {
  description = "A map of objects where each object contains information to create a AAAA record."
  type = map(object({
    name    = string
    ttl     = number
    records = list(string)
    tags    = optional(map(string), null)
  }))
  default = {}
}

variable "cname_records" {
  description = "A map of objects where each object contains information to create a CNAME record."
  type = map(object({
    name   = string
    ttl    = number
    record = string
    tags   = optional(map(string), null)
  }))
  default = {}
}

variable "mx_records" {
  description = "A map of objects where each object contains information to create a MX record."
  type = map(object({
    name = optional(string, "@")
    ttl  = number
    records = map(object({
      preference = number
      exchange   = string
    }))
    tags = optional(map(string), null)
  }))
  default = {}
}

variable "ptr_records" {
  description = "A map of objects where each object contains information to create a PTR record."
  type = map(object({
    name    = string
    ttl     = number
    records = list(string)
    tags    = optional(map(string), null)
  }))
  default = {}
}

variable "resource_group_name" {
  description = "The resource group of the private DNS zone."
  type        = string
  default     = ""
}

variable "srv_records" {
  description = "A map of objects where each object contains information to create a SRV record."
  type = map(object({
    name = string
    ttl  = number
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

variable "txt_records" {
  description = "A map of objects where each object contains information to create a TXT record."
  type = map(object({
    name = string
    ttl  = number
    records = map(object({
      value = string
    }))
    tags = optional(map(string), null)
  }))
  default = {}
}

variable "zone_name" {
  description = "The name of the private DNS zone."
  type        = string
  default     = ""
}
