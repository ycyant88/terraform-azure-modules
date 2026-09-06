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
  description = "Configure federated identity credentials, using OpenID Connect, for use in GitHub actions.\n\nThe may key is arbitrary and only used for the for_each in the resource declaration.\n\nThe map value is an object with the following attributes:\n\n- name - the name of the federated credential resource, the last segment of the Azure resource id.\n- organization - the name of the GitHub organization, e.g. Azure in https://github.com/Azure/terraform-azurerm-lz-vending.\n- repository - the name of the GitHub respository, e.g. terraform-azurerm-lz-vending in https://github.com/Azure/terraform-azurerm-lz-vending.\n- entity - one of 'environment', 'pull_request', 'tag', or 'branch'\n- enterprise_slug - the name of the GitHub Enterprise, e.g. my-enterprise. This is optional and only valid when using an enterprise.\n- value - identifies the entity type, e.g. main when using entity is branch. Should be blank when entity is pull_request.\n"
  type = map(object({
    name            = optional(string)
    organization    = string
    repository      = string
    entity          = string
    enterprise_slug = optional(string)
    value           = optional(string)
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

variable "parent_id" {
  description = "The ID of the parent resource to which this user-assigned managed identity."
  type        = string
  default     = ""
}

variable "tags" {
  description = "The tags to apply to the user-assigned managed identity"
  type        = map(string)
  default     = {}
}
