variable "backup_protected_file_share" {
  description = "Configuration for protecting one Azure file share with Azure Backup."
  type = object({
    backup_policy_id          = string
    disable_registration      = optional(bool, false)
    sleep_timer               = optional(string, "60s")
    source_file_share_name    = string
    source_storage_account_id = string
  })
  default = ""
}

variable "ignore_body_changes" {
  description = "Body-relative paths ignored on each AzAPI resource. Paths use dot notation.\nChanges take effect only after apply. Ignored configuration is not sent to Azure until the path is removed.\n\n- recoveryservices_vaults_backup_fabrics_protection_containers - Paths ignored on storage-account registration. The AzAPI action resource used for inquiry does not expose ignore_body_changes.\n- recoveryservices_vaults_backup_fabrics_protection_containers_protected_items - Paths ignored on the protected file share.\n"
  type = object({
    recoveryservices_vaults_backup_fabrics_protection_containers                 = optional(list(string), [])
    recoveryservices_vaults_backup_fabrics_protection_containers_protected_items = optional(list(string), [])
  })
  default = {}
}

variable "parent_id" {
  description = "The fully-qualified ARM resource ID of the Azure Backup storage protection container that will contain the protected file share."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by the protected file share submodule.\n\n- recoveryservices_vaults_backup_protected_items - Resource type and API version used to find an existing protected file share.\n- recoveryservices_vaults_backup_fabrics_protectable_items - Resource type and API version used to discover file shares.\n- recoveryservices_vaults_backup_fabrics_protection_containers - Resource type and API version for storage-account registration and inquiry.\n- recoveryservices_vaults_backup_fabrics_protection_containers_protected_items - Resource type and API version for the protected file share.\n"
  type = object({
    recoveryservices_vaults_backup_protected_items                               = optional(string, "Microsoft.RecoveryServices/vaults/backupProtectedItems@2024-10-01")
    recoveryservices_vaults_backup_fabrics_protectable_items                     = optional(string, "Microsoft.RecoveryServices/vaults/backupFabrics/protectableItems@2024-10-01")
    recoveryservices_vaults_backup_fabrics_protection_containers                 = optional(string, "Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers@2024-10-01")
    recoveryservices_vaults_backup_fabrics_protection_containers_protected_items = optional(string, "Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2024-10-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to every managed AzAPI resource in the submodule."
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "timeouts" {
  description = "Per-operation timeouts applied to every managed AzAPI resource in the submodule."
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
