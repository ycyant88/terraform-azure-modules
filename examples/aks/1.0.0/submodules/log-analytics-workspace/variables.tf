variable "location" {
  description = "The Azure Region in which to create the Virtual Network"
  type        = string
  default     = ""
}

variable "log_analytics_workspace_sku" {
  description = "The SKU (pricing level) of the Log Analytics workspace"
  type        = string
  default     = "PerGB2018"
}

variable "log_retention_in_days" {
  description = "The retention period for the logs in days"
  type        = string
  default     = 30
}

variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Virtual Network"
  type        = string
  default     = ""
}

variable "retention_in_days" {
  description = "The retention period for the logs in days"
  type        = string
  default     = 30
}

variable "sku" {
  description = "The SKU (pricing level) of the Log Analytics workspace"
  type        = string
  default     = "PerGB2018"
}
