variable "asc_export_resource_group_name" {
  description = "If specified, will customise the ascExportResourceGroupName parameter for the Deploy-MDFC-Config Policy Assignment when managed by the module."
  type        = string
  default     = ""
}

variable "custom_settings_by_resource_type" {
  description = "If specified, allows full customization of common settings for all resources (by type) deployed by this module."
  type        = any
  default     = {}
}

variable "enabled" {
  description = "Controls whether to manage the management landing zone policies and deploy the management resources into the current Subscription context."
  type        = bool
  default     = ""
}

variable "existing_automation_account_resource_id" {
  description = "If specified, module will skip creation of Automation Account and use existing."
  type        = string
  default     = ""
}

variable "existing_log_analytics_workspace_resource_id" {
  description = "If specified, module will skip creation of Log Analytics workspace and use existing."
  type        = string
  default     = ""
}

variable "existing_resource_group_name" {
  description = "If specified, module will skip creation of the management Resource Group and use existing."
  type        = string
  default     = ""
}

variable "link_log_analytics_to_automation_account" {
  description = "If set to true, module will link the Log Analytics workspace and Automation Account."
  type        = bool
  default     = true
}

variable "location" {
  description = "Sets the default location used for resource deployments where needed."
  type        = string
  default     = "eastus"
}

variable "resource_prefix" {
  description = "If specified, will set the resource name prefix for management resources (default value determined from \"var.root_id\")."
  type        = string
  default     = ""
}

variable "resource_suffix" {
  description = "If specified, will set the resource name suffix for management resources."
  type        = string
  default     = ""
}

variable "root_id" {
  description = "Specifies the ID of the Enterprise-scale root Management Group, used as a prefix for resources created by this module."
  type        = string
  default     = ""
}

variable "settings" {
  description = "Configuration settings for the \"Management\" landing zone resources."
  type = object({
    log_analytics = optional(object({
      enabled = optional(bool, true)
      config = optional(object({
        retention_in_days                                 = optional(number, 30)
        enable_monitoring_for_vm                          = optional(bool, true)
        enable_monitoring_for_vmss                        = optional(bool, true)
        enable_solution_for_agent_health_assessment       = optional(bool, true)
        enable_solution_for_anti_malware                  = optional(bool, true)
        enable_solution_for_change_tracking               = optional(bool, true)
        enable_solution_for_service_map                   = optional(bool, true)
        enable_solution_for_sql_assessment                = optional(bool, true)
        enable_solution_for_sql_vulnerability_assessment  = optional(bool, true)
        enable_solution_for_sql_advanced_threat_detection = optional(bool, true)
        enable_solution_for_updates                       = optional(bool, true)
        enable_solution_for_vm_insights                   = optional(bool, true)
        enable_solution_for_container_insights            = optional(bool, true)
        enable_sentinel                                   = optional(bool, true)
      }), {})
    }), {})
    security_center = optional(object({
      enabled = optional(bool, true)
      config = optional(object({
        email_security_contact             = optional(string, "security_contact@replace_me")
        enable_defender_for_app_services   = optional(bool, true)
        enable_defender_for_arm            = optional(bool, true)
        enable_defender_for_containers     = optional(bool, true)
        enable_defender_for_dns            = optional(bool, true)
        enable_defender_for_key_vault      = optional(bool, true)
        enable_defender_for_oss_databases  = optional(bool, true)
        enable_defender_for_servers        = optional(bool, true)
        enable_defender_for_sql_servers    = optional(bool, true)
        enable_defender_for_sql_server_vms = optional(bool, true)
        enable_defender_for_storage        = optional(bool, true)
      }), {})
    }), {})
  })
  default = {}
}

variable "subscription_id" {
  description = "Specifies the Subscription ID for the Subscription containing all management resources."
  type        = string
  default     = ""
}

variable "tags" {
  description = "If specified, will set the default tags for all resources deployed by this module where supported."
  type        = map(string)
  default     = {}
}
