module "avm-res-web-hostingenvironment" {
  source                          = "Azure/avm-res-web-hostingenvironment/azurerm"
  version                         = "2.1.0"
  certificate_url                 = var.certificate_url
  dns_suffix                      = var.dns_suffix
  enable_telemetry                = var.enable_telemetry
  hosting_environment_resource_id = var.hosting_environment_resource_id
  key_vault_reference_identity    = var.key_vault_reference_identity
  location                        = var.location
}
