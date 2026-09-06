variable "location" {
  description = "The Azure region to deploy resources into."
  type        = string
  default     = ""
}

variable "network_watcher_rg_name" {
  description = "The name of the resource group to create. This only needs changing for parallel testing purposes."
  type        = string
  default     = "NetworkWatcherRG"
}

variable "subscription_id" {
  description = "The ID of the subscription to deploy resources into. E.g. 00000000-0000-0000-0000-000000000000"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
