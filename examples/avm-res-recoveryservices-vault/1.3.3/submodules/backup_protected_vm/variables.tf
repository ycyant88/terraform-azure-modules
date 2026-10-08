variable "backup_protected_vm" {
  description = "Configuration for protecting one Azure virtual machine with Azure Backup."
  type = object({
    backup_policy_id = string
    sleep_timer      = optional(string, "60s")
    source_vm_id     = string
  })
  default = ""
}

variable "ignore_body_changes" {
  description = "Body-relative paths ignored on the protected item resource. Paths use dot notation.\nChanges take effect only after apply. Ignored configuration is not sent to Azure until the path is removed.\n\n- recoveryservices_vaults_backup_fabrics_protection_containers_protected_items - Paths ignored on the protected virtual machine resource.\n"
  type = object({
    recoveryservices_vaults_backup_fabrics_protection_containers_protected_items = optional(list(string), [])
  })
  default = {}
}

variable "parent_id" {
  description = "The fully-qualified ARM resource ID of the Azure Backup protection container that will contain the protected virtual machine."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by the protected virtual machine submodule.\n\n- recoveryservices_vaults_backup_fabrics_protection_containers_protected_items - Resource type and API version for the protected virtual machine.\n"
  type = object({
    recoveryservices_vaults_backup_fabrics_protection_containers_protected_items = optional(string, "Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2024-10-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to the protected virtual machine AzAPI resource."
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "timeouts" {
  description = "Per-operation timeouts applied to the protected virtual machine AzAPI resource."
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
