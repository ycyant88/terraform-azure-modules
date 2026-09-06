variable "is_slot" {
  description = "Whether the parent resource is a deployment slot. Defaults to false."
  type        = bool
  default     = false
}

variable "parent_id" {
  description = "The resource ID of the App Service site or slot."
  type        = string
  default     = ""
}

variable "storage_shares_to_mount" {
  description = "A map of Storage Account file shares to mount to the App Service.\n\n- access_key - (Required) The access key for the Storage Account.\n- account_name - (Required) The name of the Storage Account.\n- mount_path - (Required) The path to mount the share at within the App Service.\n- name - (Required) The name of the storage mount.\n- share_name - (Required) The name of the file share.\n- type - (Optional) The type of storage. Defaults to AzureFiles.\n"
  type = map(object({
    access_key   = string
    account_name = string
    mount_path   = string
    name         = string
    share_name   = string
    type         = optional(string, "AzureFiles")
  }))
  default = ""
}
