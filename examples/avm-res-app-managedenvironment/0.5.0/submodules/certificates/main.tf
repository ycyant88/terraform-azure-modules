module "avm-res-app-managedenvironment" {
  source                           = "Azure/avm-res-app-managedenvironment/azurerm"
  version                          = "0.5.0"
  certificate_key_vault_properties = var.certificate_key_vault_properties
  enable_telemetry                 = var.enable_telemetry
  location                         = var.location
  name                             = var.name
  parent_id                        = var.parent_id
  password                         = var.password
  password_version                 = var.password_version
  tags                             = var.tags
  value                            = var.value
  value_version                    = var.value_version
}
