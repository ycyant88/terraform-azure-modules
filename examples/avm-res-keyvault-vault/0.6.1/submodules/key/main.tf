module "avm-res-keyvault-vault" {
  source                = "Azure/avm-res-keyvault-vault/azurerm"
  version               = "0.6.1"
  curve                 = var.curve
  expiration_date       = var.expiration_date
  key_vault_resource_id = var.key_vault_resource_id
  name                  = var.name
  not_before_date       = var.not_before_date
  opts                  = var.opts
  role_assignments      = var.role_assignments
  rotation_policy       = var.rotation_policy
  size                  = var.size
  tags                  = var.tags
  type                  = var.type
}
