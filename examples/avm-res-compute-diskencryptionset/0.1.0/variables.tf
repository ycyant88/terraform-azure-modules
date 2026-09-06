variable "auto_key_rotation_enabled" {
  description = "Whether or not auto key rotation is enabled for the encryption set."
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "encryption_type" {
  description = "The type of encryption to be used. Allowed Values are'EncryptionAtRestWithCustomerKey', 'EncryptionAtRestWithPlatformAndCustomerKeys' and 'ConfidentialVmEncryptedWithCustomerKey'."
  type        = string
  default     = "EncryptionAtRestWithCustomerKey"
}

variable "federated_client_id" {
  description = " Multi-tenant application client id to access key vault in a different tenant."
  type        = string
  default     = null
}

variable "key_vault_key_id" {
  description = "The Key Vault Key ID used for encryption."
  type        = string
  default     = ""
}

variable "key_vault_resource_id" {
  description = "The resource ID of the Key Vault to associate with the disk encryption set."
  type        = string
  default     = ""
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

variable "managed_hsm_key_id" {
  description = "The Managed HSM Key ID used for encryption."
  type        = string
  default     = null
}

variable "managed_identities" {
  description = "Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n- system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n- user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n\nExample Input:\n\nhcl\nmanaged_identities = {\n  system_assigned = true\n}\n\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "name" {
  description = "The name of the disk encryption set."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the disk encryption set."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}
