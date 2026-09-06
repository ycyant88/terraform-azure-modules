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
