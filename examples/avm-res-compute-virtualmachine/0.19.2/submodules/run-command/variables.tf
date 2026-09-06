variable "error_blob_managed_identity" {
  description = "error_blob_managed_identity - (Optional): An error_blob_managed_identity block as defined below. User-assigned managed Identity that has access to errorBlobUri storage blob.\n"
  type = object({
    client_id = optional(string)
    object_id = optional(string)
  })
  default = null
}

variable "error_blob_uri" {
  description = "error_blob_uri - (Optional): Specifies the Azure storage blob where script error stream will be uploaded. It can be basic blob URI with SAS token.\n"
  type        = string
  default     = null
}

variable "location" {
  description = "location - (Required): The Azure Region where the Virtual Machine Run Command should exist. Changing this forces a new Virtual Machine Run Command to be created.\n"
  type        = string
  default     = ""
}

variable "name" {
  description = "name - (Required): Specifies the name of this Virtual Machine Run Command. Changing this forces a new Virtual Machine Run Command to be created.\n"
  type        = string
  default     = ""
}

variable "output_blob_managed_identity" {
  description = "output_blob_managed_identity - (Optional): An output_blob_managed_identity block as defined below. User-assigned managed Identity that has access to outputBlobUri storage blob.\n"
  type = object({
    client_id = optional(string)
    object_id = optional(string)
  })
  default = null
}

variable "output_blob_uri" {
  description = "output_blob_uri - (Optional): Specifies the Azure storage blob where script output stream will be uploaded. It can be basic blob URI with SAS token.\n"
  type        = string
  default     = null
}

variable "parameters" {
  description = "parameters - (Optional): A map of parameter blocks as defined below. The parameters used by the script.\n- map key (Required): A unique map key for each parameter.\n  - name (Required): The run parameter name.\n  - value (Required): The run parameter value.\n"
  type = map(object({
    name  = string
    value = string
  }))
  default = {}
}

variable "protected_parameters" {
  description = "protected_parameters - (Optional): A list of protected_parameter blocks as defined below. The protected parameters used by the script.\n- map key (Required): A unique map key for each parameter.\n  - name (Required): The run parameter name.\n  - value (Required): The run parameter value.\n"
  type = map(object({
    name  = string
    value = string
  }))
  default = {}
}

variable "run_as_password" {
  description = "run_as_password - (Optional): Specifies the user account password on the VM when executing the Virtual Machine Run Command.\n"
  type        = string
  default     = null
}

variable "run_as_user" {
  description = "run_as_user - (Optional): Specifies the user account on the VM when executing the Virtual Machine Run Command.\n"
  type        = string
  default     = null
}

variable "script_source" {
  description = "script_source - (Required): A source block as defined below. The source of the run command script.\n"
  type = object({
    command_id = optional(string)
    script     = optional(string)
    script_uri = optional(string)
    script_uri_managed_identity = optional(object({
      client_id = optional(string)
      object_id = optional(string)
    }))
  })
  default = ""
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

variable "virtualmachine_resource_id" {
  description = "virtualmachine_resource_id - (Required): Specifies the resource id of the Virtual Machine to apply the Run Command to.\n"
  type        = string
  default     = ""
}
