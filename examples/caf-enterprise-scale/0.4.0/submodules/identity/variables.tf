variable "enabled" {
  description = "Controls whether to manage the identity landing zone policies and deploy the identity resources into the current Subscription context."
  type        = bool
  default     = ""
}

variable "root_id" {
  description = "Specifies the ID of the Enterprise-scale root Management Group, used as a prefix for resources created by this module."
  type        = string
  default     = ""
}

variable "settings" {
  description = "Configuration settings for the \"Identity\" landing zone resources."
  type = object({
    identity = object({
      enabled = bool
      config = object({
        enable_deny_public_ip             = bool
        enable_deny_rdp_from_internet     = bool
        enable_deny_subnet_without_nsg    = bool
        enable_deploy_azure_backup_on_vms = bool
      })
    })
  })
  default = ""
}
