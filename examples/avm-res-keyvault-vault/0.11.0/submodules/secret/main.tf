module "avm-res-keyvault-vault" {
  source                = "Azure/avm-res-keyvault-vault/azurerm"
  version               = "0.11.0"
  content_type          = var.content_type
  expiration_date       = var.expiration_date
  key_vault_resource_id = var.key_vault_resource_id
  name                  = var.name
  not_before_date       = var.not_before_date
  role_assignments      = var.role_assignments
  tags                  = var.tags
  value                 = var.value
  value_wo              = var.value_wo
  value_wo_version      = var.value_wo_version
}
