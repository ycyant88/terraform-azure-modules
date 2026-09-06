variable "federated_credentials_advanced" {
  description = "Configure federated identity credentials, using OpenID Connect, for use scenarios outside GitHub Actions and Terraform Cloud.\n\nThe may key is arbitrary and only used for the for_each in the resource declaration.\n\nThe map value is an object with the following attributes:\n\n- name - the name of the federated credential resource, the last segment of the Azure resource id.\n- subject_identifier - The subject of the token.\n- issuer_url - the URL of the token issuer, should begin with https://\n- audiences - (optional) a set of strings containing the token audiences, defaults to [\"api://AzureADTokenExchange\"].\n"
  type = map(object({
    name               = string
    subject_identifier = string
    audiences          = optional(set(string), ["api://AzureADTokenExchange"])
    issuer_url         = string
  }))
  default = {}
}

variable "federated_credentials_github" {
  description = "Configure federated identity credentials, using OpenID Connect, for use in GitHub actions.\n\nThe may key is arbitrary and only used for the for_each in the resource declaration.\n\nThe map value is an object with the following attributes:\n\n- name - the name of the federated credential resource, the last segment of the Azure resource id.\n- organization - the name of the GitHub organization, e.g. Azure in https://github.com/Azure/terraform-azurerm-lz-vending.\n- repository - the name of the GitHub respository, e.g. terraform-azurerm-lz-vending in https://github.com/Azure/terraform-azurerm-lz-vending.\n- entity - one of 'environment', 'pull_request', 'tag', or 'branch'\n- value - identifies the entity type, e.g. main when using entity is branch. Should be blank when entity is pull_request.\n"
  type = map(object({
    name         = optional(string)
    organization = string
    repository   = string
    entity       = string
    value        = optional(string)
  }))
  default = {}
}

variable "federated_credentials_terraform_cloud" {
  description = "Configure federated identity credentials, using OpenID Connect, for use in Terraform Cloud.\n\nThe may key is arbitrary and only used for the for_each in the resource declaration.\n\nThe map value is an object with the following attributes:\n\n- name - the name of the federated credential resource, the last segment of the Azure resource id.\n- organization - the name of the Terraform Cloud organization.\n- project - the name of the Terraform Cloud project.\n- workspace - the name of the Terraform Cloud workspace.\n- run_phase - one of plan, or apply.\n"
  type = map(object({
    name         = optional(string)
    organization = string
    project      = string
    workspace    = string
    run_phase    = string
  }))
  default = {}
}

variable "location" {
  description = "The location of the user-assigned managed identity"
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the user managed identity"
  type        = string
  default     = ""
}

variable "resource_group_creation_enabled" {
  description = "Resource group values DEPRECATED\n\nThe creation of resource groups should be done using the resource module, in v6.0.0 these variables will be retired from the virtual network objects.\n\nWhether to create the supplied resource group for the user-assigned managed identity\n"
  type        = bool
  default     = true
}

variable "resource_group_lock_enabled" {
  description = "Resource group values DEPRECATED\n\nThe creation of resource groups should be done using the resource module, in v6.0.0 these variables will be retired from the virtual network objects.\n\nWhether to enable resource group lock for the user-assigned managed identity resource group\n"
  type        = bool
  default     = true
}

variable "resource_group_lock_name" {
  description = "Resource group values DEPRECATED\n\nThe creation of resource groups should be done using the resource module, in v6.0.0 these variables will be retired from the virtual network objects.\n\nThe name of the resource group lock for the user-assigned managed identity resource group, if null will be set to lock-<resource_group_name>\n"
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the user-assigned managed identity"
  type        = string
  default     = ""
}

variable "resource_group_tags" {
  description = "Resource group values DEPRECATED\n\nThe creation of resource groups should be done using the resource module, in v6.0.0 these variables will be retired from the virtual network objects.\n\nThe tags to apply to the user-assigned managed identity resource group, if we create it.\n"
  type        = map(string)
  default     = {}
}

variable "subscription_id" {
  description = "The id of the target subscription. Must be a GUID in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx. All letters must be lowercase."
  type        = string
  default     = ""
}

variable "tags" {
  description = "The tags to apply to the user-assigned managed identity"
  type        = map(string)
  default     = {}
}
