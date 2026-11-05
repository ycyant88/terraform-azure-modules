module "avm-res-keyvault-vault" {
  source                = "Azure/avm-res-keyvault-vault/azurerm"
  version               = "0.13.0"
  curve                 = var.curve
  enable_telemetry      = var.enable_telemetry
  expiration_date       = var.expiration_date
  key_vault_resource_id = var.key_vault_resource_id
  location              = var.location
  name                  = var.name
  not_before_date       = var.not_before_date
  opts                  = var.opts
  release_policy        = var.release_policy
  role_assignments      = var.role_assignments
  rotation_policy       = var.rotation_policy
  size                  = var.size
  tags                  = var.tags
  type                  = var.type
}
