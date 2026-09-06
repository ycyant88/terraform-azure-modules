variable "domain_control_validation" {
  description = "The domain control validation method. Possible values: 'CNAME', 'HTTP', 'TXT'. Defaults to 'HTTP'."
  type        = string
  default     = "HTTP"
}

variable "location" {
  description = "The Azure region where the managed certificate resource should be created."
  type        = string
  default     = ""
}

variable "managed_environment" {
  description = "The managed environment resource."
  type = object({
    resource_id = string
  })
  default = ""
}

variable "name" {
  description = "The name of the managed certificate resource."
  type        = string
  default     = ""
}

variable "subject_name" {
  description = "The subject name (domain name) for the certificate."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = " - create - (Defaults to 30 minutes) Used when creating the managed certificate.\n - delete - (Defaults to 30 minutes) Used when deleting the managed certificate.\n - read - (Defaults to 5 minutes) Used when retrieving the managed certificate.\n - update - (Defaults to 30 minutes) Used when updating the managed certificate.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
