variable "actions" {
  description = "List of actions to attach to the scope map."
  type        = list(string)
  default     = ""
}

variable "container_registry_name" {
  description = "The name of the Container Registry."
  type        = string
  default     = ""
}

variable "description" {
  description = "The description of the Container Registry."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the scope map."
  type        = string
  default     = ""
}

variable "registry_tokens" {
  description = "A map of Azure Container Registry token associated to a scope map. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - Specifies the name of the token.\n- enabled - Should the Container Registry token be enabled? Defaults to true.\"\n"
  type = map(object({
    name    = string
    enabled = optional(bool, true)
    passwords = optional(object({
      password1 = object({
        expiry = optional(string)
      })
      password2 = optional(object({
        expiry = optional(string)
      }))
    }))
  }))
  default = {}
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Container Registry scope and token(if variable registry_tokens is defined)."
  type        = string
  default     = ""
}
