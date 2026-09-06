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
    identity = optional(object({
      enabled = optional(bool, true)
      config = optional(object({
        enable_deny_public_ip             = optional(bool, true)
        enable_deny_rdp_from_internet     = optional(bool, true)
        enable_deny_subnet_without_nsg    = optional(bool, true)
        enable_deploy_azure_backup_on_vms = optional(bool, true)
      }), {})
    }), {})
  })
  default = {}
}
