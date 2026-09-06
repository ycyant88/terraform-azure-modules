module "avm-res-web-site" {
  source                = "Azure/avm-res-web-site/azurerm"
  version               = "0.22.0"
  host_names            = var.host_names
  key_vault_id          = var.key_vault_id
  key_vault_secret_name = var.key_vault_secret_name
  location              = var.location
  name                  = var.name
  parent_id             = var.parent_id
  password              = var.password
  pfx_blob              = var.pfx_blob
  retry                 = var.retry
  server_farm_id        = var.server_farm_id
  tags                  = var.tags
}
