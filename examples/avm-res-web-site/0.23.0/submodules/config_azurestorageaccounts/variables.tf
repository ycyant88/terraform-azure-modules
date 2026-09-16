variable "ignore_body_changes" {
  description = "Body-relative paths whose changes are ignored, keyed by AzAPI resource type. Paths use dot notation, and a change takes effect only after an apply.\n\nThe AzAPI provider exposes ignore_body_changes on azapi_resource only, and this module manages its resource with a type that does not accept the argument. The variable exists for interface consistency; setting a non-empty value fails the plan with an explicit error rather than being silently ignored.\n- web_sites - Paths ignored on the storage account mounts on a site.\n- web_sites_slots - Paths ignored on the storage account mounts on a slot.\n"
  type = object({
    web_sites       = optional(list(string), [])
    web_sites_slots = optional(list(string), [])
  })
  default = {}
}

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

variable "resource_types" {
  description = "AzAPI resource types and API versions used by this module.\n\n- web_sites - Resource type and API version for the storage account mounts on a site.\n- web_sites_slots - Resource type and API version for the storage account mounts on a slot.\n"
  type = object({
    web_sites       = optional(string, "Microsoft.Web/sites@2025-03-01")
    web_sites_slots = optional(string, "Microsoft.Web/sites/slots@2025-03-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration for the AzAPI resources declared by this module. Defaults to retrying the conflict Azure returns while another operation on the site is in progress.\n\n- error_message_regex - (Optional) A list of regular expressions matched against error messages. A match triggers a retry.\n- interval_seconds - (Optional) The initial interval in seconds between retries.\n- max_interval_seconds - (Optional) The maximum interval in seconds between retries.\n"
  type = object({
    error_message_regex  = optional(list(string), ["Cannot modify this site because another operation is in progress"])
    interval_seconds     = optional(number, 10)
    max_interval_seconds = optional(number)
  })
  default = {}
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

variable "timeouts" {
  description = "Per-operation timeouts applied to the AzAPI resources declared by this module. Defaults to null, which uses the provider defaults. Each value is a Go duration string such as 30m.\n\n- create - (Optional) Timeout for create operations.\n- delete - (Optional) Timeout for delete operations.\n- read - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
