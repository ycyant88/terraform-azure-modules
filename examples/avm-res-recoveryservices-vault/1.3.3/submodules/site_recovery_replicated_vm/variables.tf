variable "ignore_body_changes" {
  description = "Body-relative paths reserved for the replicated item operations. Paths use dot notation.\nChanges take effect only after apply. Ignored configuration is not sent to Azure until the path is removed.\n\n- recoveryservices_vaults_replication_fabrics_replication_protection_containers_replication_protected_items - Reserved for the replicated item. The AzAPI action and update resources currently do not expose ignore_body_changes, so non-empty values cannot yet be applied.\n"
  type = object({
    recoveryservices_vaults_replication_fabrics_replication_protection_containers_replication_protected_items = optional(list(string), [])
  })
  default = {}
}

variable "parent_id" {
  description = "The fully-qualified ARM resource ID of the source Site Recovery protection container."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by the replicated virtual machine submodule.\n\n- recoveryservices_vaults_replication_fabrics_replication_protection_containers_replication_protected_items - Resource type and API version for the replicated item and its actions.\n"
  type = object({
    recoveryservices_vaults_replication_fabrics_replication_protection_containers_replication_protected_items = optional(string, "Microsoft.RecoveryServices/vaults/replicationFabrics/replicationProtectionContainers/replicationProtectedItems@2024-04-01")
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

variable "site_recovery_replicated_vm" {
  description = "Configuration for one Azure-to-Azure Site Recovery replicated virtual machine."
  type = object({
    managed_disk = optional(map(object({
      disk_id                       = string
      staging_storage_account_id    = string
      target_disk_encryption_set_id = optional(string)
      target_disk_type              = optional(string, "Standard_LRS")
      target_replica_disk_type      = optional(string, "Standard_LRS")
      target_resource_group_id      = optional(string)
    })))
    multi_vm_group_name                    = optional(string)
    recovery_replication_policy_id         = string
    recovery_resource_group_id             = optional(string)
    recovery_storage_account_id            = optional(string)
    recovery_target_disk_encryption_set_id = optional(string)
    source_vm_id                           = string
    target_network_id                      = optional(string)
    target_protection_container_id         = string
    target_recovery_fabric_id              = optional(string)
    target_resource_group_id               = optional(string)
    target_resource_id                     = optional(string)
    target_static_ip                       = optional(string)
    target_subnet_name                     = optional(string)
    target_virtual_machine_size            = optional(string)
    test_network_id                        = optional(string)
    test_subnet_name                       = optional(string)
    unmanaged_disk = optional(map(object({
      disk_uri                   = string
      staging_storage_account_id = optional(string)
      target_storage_account_id  = optional(string)
    })))
  })
  default = ""
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
