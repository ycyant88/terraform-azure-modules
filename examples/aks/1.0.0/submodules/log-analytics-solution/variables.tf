variable "location" {
  description = "The Azure region in which to create the Virtual Network"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Log Analytics solution will be created"
  type        = string
  default     = ""
}

variable "workspace_name" {
  description = "The name of the workspace created for Log Analytics"
  type        = string
  default     = ""
}

variable "workspace_resource_id" {
  description = "The id of the workspace created for Log Analytics"
  type        = string
  default     = ""
}
