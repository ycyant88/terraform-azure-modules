variable "certificate_url" {
  description = "The URL referencing the Azure Key Vault certificate secret that should be used as the default SSL/TLS certificate for sites with the custom domain suffix."
  type        = string
  default     = ""
}

variable "dns_suffix" {
  description = "The default custom domain suffix to use for all sites deployed on the ASE."
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "hosting_environment_resource_id" {
  description = "The resource ID of the App Service Environment (ASE) to configure the custom DNS suffix for."
  type        = string
  default     = ""
}

variable "key_vault_reference_identity" {
  description = "The user-assigned identity to use for resolving the key vault certificate reference. If not specified, the system-assigned ASE identity will be used if available."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = null
}
