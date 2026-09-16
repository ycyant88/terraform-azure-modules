variable "hostname" {
  description = "The hostname to bind to the site."
  type        = string
  default     = ""
}

variable "ignore_body_changes" {
  description = "Body-relative paths whose changes are ignored, keyed by AzAPI resource type. Paths use dot notation, and a change takes effect only after an apply.\n\n- web_sites_host_name_bindings - Paths ignored on the hostname binding on a site.\n- web_sites_slots_host_name_bindings - Paths ignored on the hostname binding on a slot.\n"
  type = object({
    web_sites_host_name_bindings       = optional(list(string), [])
    web_sites_slots_host_name_bindings = optional(list(string), [])
  })
  default = {}
}

variable "parent_id" {
  description = "The resource ID of the App Service site or slot."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by this module.\n\n- web_sites_host_name_bindings - Resource type and API version for the hostname binding on a site.\n- web_sites_slots_host_name_bindings - Resource type and API version for the hostname binding on a slot.\n"
  type = object({
    web_sites_host_name_bindings       = optional(string, "Microsoft.Web/sites/hostNameBindings@2025-03-01")
    web_sites_slots_host_name_bindings = optional(string, "Microsoft.Web/sites/slots/hostNameBindings@2025-03-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration for the AzAPI resources declared by this module. Defaults to retrying the conflict Azure returns while another operation on the site is in progress.\n\n- error_message_regex - (Optional) A list of regular expressions matched against error messages. A match triggers a retry.\n- interval_seconds - (Optional) The initial interval in seconds between retries.\n- max_interval_seconds - (Optional) The maximum interval in seconds between retries.\n"
  type = object({
    error_message_regex  = optional(list(string), ["Cannot modify this site because another operation is in progress"])
    interval_seconds     = optional(number, 10)
    max_interval_seconds = optional(number)
  })
  default = {}
}

variable "ssl_state" {
  description = "The SSL state for the hostname binding. Possible values include Disabled, IpBasedEnabled, SniEnabled."
  type        = string
  default     = null
}

variable "thumbprint" {
  description = "The certificate thumbprint associated with the hostname."
  type        = string
  default     = null
}

variable "timeouts" {
  description = "Per-operation timeouts applied to the AzAPI resources declared by this module. Defaults to null, which uses the provider defaults. Each value is a Go duration string such as 30m.\n\n- create - (Optional) Timeout for create operations.\n- delete - (Optional) Timeout for delete operations.\n- read - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
