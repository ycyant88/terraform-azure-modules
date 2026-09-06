variable "dev_center_catalog_adogit" {
  description = "A map describing the dev center catalog Azure DevOps Git repository.\n- branch - (Required) The Git branch of the Dev Center Catalog.\n- path - (Required) The folder where the catalog items can be found inside the repository.\n- key_vault_key_url - (Required) A reference to the Key Vault secret containing a security token to authenticate to a Git repository.\n- uri - (Required) The Git URI of the Dev Center Catalog.\n"
  type = object({
    branch            = string
    path              = string
    key_vault_key_url = string
    uri               = string
  })
  default = null
}

variable "dev_center_catalog_dev_center_id" {
  description = "(Required) Specifies the Dev Center ID. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "dev_center_catalog_github" {
  description = "A map describing the dev center catalog GitHub repository.\n- branch - (Required) The Git branch of the Dev Center Catalog.\n- path - (Required) The folder where the catalog items can be found inside the repository..\n- key_vault_key_url - (Required) A reference to the Key Vault secret containing a security token to authenticate to a Git repository.\n- uri - (Required) The Git URI of the Dev Center Catalog.\n"
  type = object({
    branch            = string
    path              = string
    key_vault_key_url = string
    uri               = string
  })
  default = null
}

variable "dev_center_catalog_name" {
  description = "(Required) Specifies the name of the Dev Center Catalog. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "dev_center_catalog_resource_group_name" {
  description = "(Required) Specifies the name of the resource group in which the Dev Center Catalog should be created."
  type        = string
  default     = ""
}
