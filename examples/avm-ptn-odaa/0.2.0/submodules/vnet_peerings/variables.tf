variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = ""
}

variable "primary_vnet_name" {
  description = "Name of the source vnet"
  type        = string
  default     = ""
}

variable "primary_vnet_resource_group" {
  description = "Name of the resource group of source vnet"
  type        = string
  default     = ""
}

variable "secondary_vnet_name" {
  description = "Name of the destination vnet"
  type        = string
  default     = ""
}

variable "secondary_vnet_resource_group" {
  description = "Name of the resource group of destination vnet"
  type        = string
  default     = ""
}
