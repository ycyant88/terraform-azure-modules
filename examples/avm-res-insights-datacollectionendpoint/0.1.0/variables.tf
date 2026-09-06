variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "kind" {
  description = "The kind of the this resource."
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "public_network_access_enabled" {
  description = "Whether network access from public internet to the Data Collection Endpoint are allowed"
  type        = bool
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}
