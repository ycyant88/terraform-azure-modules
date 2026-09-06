variable "domain_control_validation" {
  description = "Selected type of domain control validation for managed certificates.\n"
  type        = any
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The location of the resource.\n"
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the resource.\n"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The parent resource ID for this resource.\n"
  type        = string
  default     = ""
}

variable "subject_name" {
  description = "Subject name of the certificate.\n"
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) Tags of the resource.\n"
  type        = map(string)
  default     = null
}
