variable "a_records" {
  description = "A map of objects where each object contains information to create a A record."
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

variable "aaaa_records" {
  description = "A map of objects where each object contains information to create a AAAA record."
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

variable "cname_records" {
  description = "A map of objects where each object contains information to create a CNAME record."
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    record              = string
    tags                = optional(map(string), null)
  }))
  default = {}
}

variable "domain_name" {
  description = "The name of the private dns zone."
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
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

variable "soa_record" {
  description = "optional soa_record variable, if included only email is required, rest are optional. Email must use username.corp.com and not username@corp.com"
  type = object({
    email        = string
    expire_time  = optional(number, 2419200)
    minimum_ttl  = optional(number, 10)
    refresh_time = optional(number, 3600)
    retry_time   = optional(number, 300)
    ttl          = optional(number, 3600)
    tags         = optional(map(string), null)
  })
  default = null
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

variable "timeouts" {
  description = "A map of timeouts objects, per resource type, to apply to the creation and destruction of resources the following resources:\n\n- dns_zones - (Optional) The timeouts for DNS Zones.\n- vnet_links - (Optional) The timeouts for DNS Zones Virtual Network Links.\n\nEach timeout object has the following optional attributes:\n\n- create - (Optional) The timeout for creating the resource. Defaults to 5m apart from policy assignments, where this is set to 15m.\n- delete - (Optional) The timeout for deleting the resource. Defaults to 5m.\n- update - (Optional) The timeout for updating the resource. Defaults to 5m.\n- read - (Optional) The timeout for reading the resource. Defaults to 5m.\n\n"
  type = object({
    dns_zones = optional(object({
      create = optional(string, "30m")
      delete = optional(string, "30m")
      update = optional(string, "30m")
      read   = optional(string, "5m")
      }), {}
    )
    vnet_links = optional(object({
      create = optional(string, "30m")
      delete = optional(string, "30m")
      update = optional(string, "30m")
      read   = optional(string, "5m")
      }), {}
    )
  })
  default = {}
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

variable "virtual_network_links" {
  description = "A map of objects where each object contains information to create a virtual network link."
  type = map(object({
    vnetlinkname     = string
    vnetid           = string
    autoregistration = optional(bool, false)
    tags             = optional(map(string), null)
  }))
  default = {}
}
