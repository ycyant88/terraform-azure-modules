variable "location" {
  description = "The Azure region to deploy resources into. E.g. eastus"
  type        = string
  default     = ""
}

variable "lock_enabled" {
  description = "Whether to enable resource group lock for the resource group"
  type        = bool
  default     = false
}

variable "lock_name" {
  description = "The name of the resource group lock for the resource group, if null will be set to lock-<resource_group_name>"
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group E.g. rg-test"
  type        = string
  default     = ""
}

variable "subscription_id" {
  description = "The ID of the subscription to deploy resources into. E.g. 00000000-0000-0000-0000-000000000000"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags to be applied to the resource group"
  type        = map(string)
  default     = {}
}
