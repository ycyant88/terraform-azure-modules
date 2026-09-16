module "avm-res-web-site" {
  source                = "Azure/avm-res-web-site/azurerm"
  version               = "0.23.0"
  host_names            = var.host_names
  ignore_body_changes   = var.ignore_body_changes
  key_vault_id          = var.key_vault_id
  key_vault_secret_name = var.key_vault_secret_name
  location              = var.location
  name                  = var.name
  parent_id             = var.parent_id
  password              = var.password
  pfx_blob              = var.pfx_blob
  resource_types        = var.resource_types
  retry                 = var.retry
  server_farm_id        = var.server_farm_id
  tags                  = var.tags
  timeouts              = var.timeouts
}
