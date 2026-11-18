variable "charset" {
  description = "The charset for the PostgreSQL database."
  type        = string
  default     = null
}

variable "collation" {
  description = "The collation for the PostgreSQL database."
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = null
}

variable "name" {
  description = "Specifies the name of the PostgreSQL database."
  type        = string
  default     = ""
}

variable "server_id" {
  description = "The resource ID of the PostgreSQL Flexible Server that will host the database."
  type        = string
  default     = ""
}

variable "timeouts" {
  description = "Optional timeout configuration for the PostgreSQL database resource."
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
  })
  default = null
}
