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
