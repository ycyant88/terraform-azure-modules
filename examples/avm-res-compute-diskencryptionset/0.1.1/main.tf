module "avm-res-compute-diskencryptionset" {
  source                            = "Azure/avm-res-compute-diskencryptionset/azurerm"
  version                           = "0.1.1"
  auto_key_rotation_enabled         = var.auto_key_rotation_enabled
  enable_telemetry                  = var.enable_telemetry
  encryption_type                   = var.encryption_type
  federated_client_id               = var.federated_client_id
  key_vault_key_id                  = var.key_vault_key_id
  key_vault_resource_id             = var.key_vault_resource_id
  key_vault_role_assignment_enabled = var.key_vault_role_assignment_enabled
  location                          = var.location
  lock                              = var.lock
  managed_hsm_key_id                = var.managed_hsm_key_id
  managed_identities                = var.managed_identities
  name                              = var.name
  resource_group_name               = var.resource_group_name
  tags                              = var.tags
}
