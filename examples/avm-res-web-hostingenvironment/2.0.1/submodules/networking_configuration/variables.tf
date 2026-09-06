variable "allow_new_private_endpoint_connections" {
  description = "Enable new private endpoint connection creation on the App Service Environment (ASE). Defaults to true."
  type        = bool
  default     = true
}

variable "ftp_enabled" {
  description = "Enable FTP on the App Service Environment (ASE). Defaults to false."
  type        = bool
  default     = false
}

variable "hosting_environment_resource_id" {
  description = "The resource ID of the App Service Environment (ASE) to configure networking for."
  type        = string
  default     = ""
}

variable "remote_debug_enabled" {
  description = "Enable Remote Debug on the App Service Environment (ASE)."
  type        = bool
  default     = null
}
