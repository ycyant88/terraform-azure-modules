variable "hostname" {
  description = "The hostname to bind to the site."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The resource ID of the App Service site or slot."
  type        = string
  default     = ""
}

variable "retry" {
  description = "Retry configuration for azapi resources. By default, retries on transient site lock errors and on the DNS / hostname validation errors that surface while custom domain ownership records are still propagating."
  type = object({
    error_message_regex = list(string)
    interval_seconds    = optional(number, 10)
    max_retries         = optional(number, 3)
  })
  default = { "error_message_regex" : ["Cannot modify this site because another operation is in progress", "A CNAME record pointing from .* was not found", "A TXT record pointing from asuid\\..* was not found", "Hostname .* does not resolve to the controller IP address", "Validation failed for a hostname"] }
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
