variable "access_key" {
  description = "The access key for the Azure file storage."
  type        = string
  default     = ""
}

variable "access_mode" {
  description = "The access mode for the Azure file storage."
  type        = string
  default     = "ReadOnly"
}

variable "account_name" {
  description = "The account name for the Azure file storage."
  type        = string
  default     = ""
}

variable "managed_environment" {
  description = "The storage component resource."
  type = object({
    resource_id = string
  })
  default = ""
}

variable "name" {
  description = "The name of the storage resource."
  type        = string
  default     = ""
}

variable "share_name" {
  description = "The share name for the Azure file storage."
  type        = string
  default     = ""
}

variable "timeouts" {
  description = " - create - (Defaults to 30 minutes) Used when creating the storage component.\n - delete - (Defaults to 30 minutes) Used when deleting the storage component.\n - read - (Defaults to 5 minutes) Used when retrieving the storage component.\n - update - (Defaults to 30 minutes) Used when updating the storage component.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
