variable "create_option" {
  description = "(Required) The method to use when creating the managed disk. Changing this forces a new resource to be created. Possible values include: * Import"
  type        = string
  default     = ""
}

variable "customer_managed_key" {
  description = "A map describing customer-managed keys to associate with the resource. This includes the following properties:\n- key_vault_resource_id - The resource ID of the Key Vault where the key is stored.\n- key_name - The name of the key.\n- key_version - (Optional) The version of the key. If not specified, the latest version is used.\n- user_assigned_identity - (Optional) An object representing a user-assigned identity with the following properties:\n  - resource_id - The resource ID of the user-assigned identity.\n"
  type = object({
    key_vault_resource_id = string
    key_name              = string
    key_version           = optional(string, null)
    user_assigned_identity = optional(object({
      resource_id = string
    }), null)
  })
  default = null
}

variable "disk_access_id" {
  description = "(Optional) The ID of the disk access resource for using private endpoints on disks."
  type        = string
  default     = null
}

variable "disk_encryption_set_id" {
  description = "(Optional) The ID of a Disk Encryption Set which should be used to encrypt this Managed Disk. Conflicts with secure_vm_disk_encryption_set_id."
  type        = string
  default     = null
}

variable "disk_iops_read_only" {
  description = "(Optional) The number of IOPS allowed across all VMs mounting the shared disk as read-only; only settable for UltraSSD disks and PremiumV2 disks with shared disk enabled. One operation can transfer between 4k and 256k bytes."
  type        = number
  default     = null
}

variable "disk_iops_read_write" {
  description = "(Optional) The number of IOPS allowed for this disk; only settable for UltraSSD disks and PremiumV2 disks. One operation can transfer between 4k and 256k bytes."
  type        = number
  default     = null
}

variable "disk_mbps_read_only" {
  description = "(Optional) The bandwidth allowed across all VMs mounting the shared disk as read-only; only settable for UltraSSD disks and PremiumV2 disks with shared disk enabled. MBps means millions of bytes per second."
  type        = number
  default     = null
}

variable "disk_mbps_read_write" {
  description = "(Optional) The bandwidth allowed for this disk; only settable for UltraSSD disks and PremiumV2 disks. MBps means millions of bytes per second."
  type        = number
  default     = null
}

variable "disk_size_gb" {
  description = "(Optional) (Optional, Required for a new managed disk) Specifies the size of the managed disk to create in gigabytes. If create_option is Copy or FromImage, then the value must be equal to or greater than the source's size. The size can only be increased."
  type        = number
  default     = null
}

variable "edge_zone" {
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Managed Disk should exist. Changing this forces a new Managed Disk to be created."
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "encryption_settings" {
  description = "- enabled - \n\n---\ndisk_encryption_key block supports the following:\n- secret_url - (Required) The URL to the Key Vault Secret used as the Disk Encryption Key. This can be found as id on the azurerm_key_vault_secret resource.\n- source_vault_id - (Required) The ID of the source Key Vault. This can be found as id on the azurerm_key_vault resource.\n\n---\nkey_encryption_key block supports the following:\n- key_url - (Required) The URL to the Key Vault Key used as the Key Encryption Key. This can be found as id on the azurerm_key_vault_key resource.\n- source_vault_id - (Required) The ID of the source Key Vault. This can be found as id on the azurerm_key_vault resource.\n"
  type = object({
    enabled = optional(bool)
    disk_encryption_key = optional(object({
      secret_url      = string
      source_vault_id = string
    }))
    key_encryption_key = optional(object({
      key_url         = string
      source_vault_id = string
    }))
  })
  default = null
}

variable "gallery_image_reference_id" {
  description = "(Optional) ID of a Gallery Image Version to copy when create_option is FromImage. This field cannot be specified if image_reference_id is specified. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "hyper_v_generation" {
  description = "(Optional) The HyperV Generation of the Disk when the source of an Import or Copy operation targets a source that contains an operating system. Possible values are V1 and V2. For ImportSecure it must be set to V2. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "image_reference_id" {
  description = "(Optional) ID of an existing platform/marketplace disk image to copy when create_option is FromImage. This field cannot be specified if gallery_image_reference_id is specified. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "logical_sector_size" {
  description = "(Optional) Logical Sector Size. Possible values are: 512 and 4096. Defaults to 4096. Changing this forces a new resource to be created."
  type        = number
  default     = null
}

variable "max_shares" {
  description = "(Optional) The maximum number of VMs that can attach to the disk at the same time. Value greater than one indicates a disk that can be mounted on multiple VMs at the same time."
  type        = number
  default     = null
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "network_access_policy" {
  description = "(Optional) Policy for accessing the disk via network. Allowed values are AllowAll, AllowPrivate, and DenyAll."
  type        = string
  default     = null
}

variable "on_demand_bursting_enabled" {
  description = "(Optional) Specifies if On-Demand Bursting is enabled for the Managed Disk."
  type        = bool
  default     = null
}

variable "optimized_frequent_attach_enabled" {
  description = "(Optional) Specifies whether this Managed Disk should be optimized for frequent disk attachments (where a disk is attached/detached more than 5 times in a day). Defaults to false."
  type        = bool
  default     = null
}

variable "os_type" {
  description = "(Optional) Specify a value when the source of an Import, ImportSecure or Copy operation targets a source that contains an operating system. Valid values are Linux or Windows."
  type        = string
  default     = null
}

variable "performance_plus_enabled" {
  description = "(Optional) Specifies whether Performance Plus is enabled for this Managed Disk. Defaults to false. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "private_endpoints" {
  description = "A map of private endpoints to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the private endpoint. One will be generated if not set.\n- role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n- lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n- tags - (Optional) A mapping of tags to assign to the private endpoint.\n- subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n- private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n- private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n- application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n- network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n- location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n- resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of this resource.\n- ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - The name of the IP configuration.\n  - private_ip_address - The private IP address of the IP configuration.\n"
  type = map(object({
    name = optional(string, null)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    tags                                    = optional(map(string), null)
    subnet_resource_id                      = string
    private_dns_zone_group_name             = optional(string, "default")
    private_dns_zone_resource_ids           = optional(set(string), [])
    application_security_group_associations = optional(map(string), {})
    private_service_connection_name         = optional(string, null)
    network_interface_name                  = optional(string, null)
    location                                = optional(string, null)
    resource_group_name                     = optional(string, null)
    ip_configurations = optional(map(object({
      name               = string
      private_ip_address = string
    })), {})
  }))
  default = {}
}

variable "private_endpoints_manage_dns_zone_group" {
  description = "Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally, e.g. using Azure Policy."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "(Optional) Whether it is allowed to access the disk via public network. Defaults to true."
  type        = bool
  default     = null
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
  }))
  default = {}
}

variable "secure_vm_disk_encryption_set_id" {
  description = "(Optional) The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk when the Virtual Machine is a Confidential VM. Conflicts with disk_encryption_set_id. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "security_type" {
  description = "(Optional) Security Type of the Managed Disk when it is used for a Confidential VM. Possible values are ConfidentialVM_VMGuestStateOnlyEncryptedWithPlatformKey, ConfidentialVM_DiskEncryptedWithPlatformKey and ConfidentialVM_DiskEncryptedWithCustomerKey. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "source_resource_id" {
  description = "(Optional) The ID of an existing Managed Disk or Snapshot to copy when create_option is Copy or the recovery point to restore when create_option is Restore. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "source_uri" {
  description = "(Optional) URI to a valid VHD file to be used when create_option is Import or ImportSecure. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "storage_account_id" {
  description = "(Optional) The ID of the Storage Account where the source_uri is located. Required when create_option is set to Import or ImportSecure. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "storage_account_type" {
  description = "(Required) The type of storage to use for the managed disk. Possible values are Standard_LRS, StandardSSD_ZRS, Premium_LRS, PremiumV2_LRS, Premium_ZRS, StandardSSD_LRS or UltraSSD_LRS."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "tier" {
  description = "(Optional) The disk performance tier to use. Possible values are documented [here](https://docs.microsoft.com/azure/virtual-machines/disks-change-performance). This feature is currently supported only for premium SSDs."
  type        = string
  default     = null
}

variable "trusted_launch_enabled" {
  description = "(Optional) Specifies if Trusted Launch is enabled for the Managed Disk. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "upload_size_bytes" {
  description = "(Optional) Specifies the size of the managed disk to create in bytes. Required when create_option is Upload. The value must be equal to the source disk to be copied in bytes. Source disk size could be calculated with ls -l or wc -c. More information can be found at [Copy a managed disk](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/disks-upload-vhd-to-managed-disk-cli#copy-a-managed-disk). Changing this forces a new resource to be created."
  type        = number
  default     = null
}

variable "zone" {
  description = "(Optional) Specifies the Availability Zone in which this Managed Disk should be located. Changing this property forces a new resource to be created."
  type        = string
  default     = null
}
