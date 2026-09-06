variable "auto_upgrade_minor_version" {
  description = "auto_upgrade_minor_version - (Optional) - Set this to false to avoid automatic upgrades for minor versions on the extension.  Defaults to true\n"
  type        = bool
  default     = true
}

variable "automatic_upgrade_enabled" {
  description = "automatic_upgrade_enabled - (Optional) - Set this to false to avoid automatic upgrades for major versions on the extension.  Defaults to true\n"
  type        = bool
  default     = true
}

variable "failure_suppression_enabled" {
  description = "failure_suppression_enabled - (Optional) - Should failures from the extension be suppressed? Possible values are true or false. Defaults to false. Operational failures such as not connecting to the VM will not be suppressed regardless of the failure_suppression_enabled value.\n"
  type        = bool
  default     = false
}

variable "name" {
  description = "name - (Required) - Set a custom name on this value if you want the guest configuration extension to have a custom name.\n"
  type        = string
  default     = ""
}

variable "protected_settings" {
  description = "protected_settings - (Optional) - The protected_settings passed to the extension, like settings, these are specified as a JSON object in a string. Certain VM Extensions require that the keys in the protected_settings block are case sensitive. If you're seeing unhelpful errors, please ensure the keys are consistent with how Azure is expecting them (for instance, for the JsonADDomainExtension extension, the keys are expected to be in TitleCase.)\n"
  type        = string
  default     = null
}

variable "protected_settings_from_key_vault" {
  description = "protected_settings_from_key_vault - (Optional) object for protected settings.  Cannot be used with protected_settings\n    - secret_url (Required) - The Secret URL of a Key Vault Certificate. This can be sourced from the secret_id field within the azurerm_key_vault_certificate Resource.\n    - source_vault_id (Required) - the Azure resource ID of the key vault holding the secret\n"
  type = object({
    secret_url      = string
    source_vault_id = string
  })
  default = { "secret_url" : null, "source_vault_id" : null }
}

variable "provision_after_extensions" {
  description = "provision_after_extensions - (Optional) - list of strings that specifies the collection of extension names after which this extension needs to be provisioned.\n"
  type        = list(string)
  default     = []
}

variable "publisher" {
  description = "publisher - (Required) - Configure the publisher for the extension to be deployed. The Publisher and Type of Virtual Machine Extensions can be found using the Azure CLI, via: az vm extension image list --location westus -o table.\n"
  type        = string
  default     = ""
}

variable "settings" {
  description = "settings - (Optional) - The settings passed to the extension, these are specified as a JSON object in a string. Certain VM Extensions require that the keys in the settings block are case sensitive. If you're seeing unhelpful errors, please ensure the keys are consistent with how Azure is expecting them (for instance, for the JsonADDomainExtension extension, the keys are expected to be in TitleCase.)\n"
  type        = string
  default     = null
}

variable "tags" {
  description = "tags - (Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "An object of timeouts to apply to the creation and destruction of resources.\n\n- create - (Optional) The timeout for creating the resource.\n- delete - (Optional) The timeout for deleting the resource.\n- update - (Optional) The timeout for updating the resource.\n- read - (Optional) The timeout for reading the resource.\n\nEach time duration is parsed using this function: <https://pkg.go.dev/time#ParseDuration>.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    update = optional(string)
    read   = optional(string)
  })
  default = {}
}

variable "type" {
  description = "type - (Required) - Configure the type value for the extension to be deployed.\n"
  type        = string
  default     = ""
}

variable "type_handler_version" {
  description = "type_handler_version - (Required) - The type handler version for the extension. A common value is 1.0.\n"
  type        = string
  default     = ""
}

variable "virtualmachine_resource_id" {
  description = "virtualmachine_resource_id - (Required): Specifies the resource id of the Virtual Machine to apply the Run Command to.\n"
  type        = string
  default     = ""
}
