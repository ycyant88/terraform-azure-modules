module "avm-res-web-hostingenvironment" {
  source                          = "Azure/avm-res-web-hostingenvironment/azurerm"
  version                         = "2.0.1"
  certificate_url                 = var.certificate_url
  dns_suffix                      = var.dns_suffix
  hosting_environment_resource_id = var.hosting_environment_resource_id
  key_vault_reference_identity    = var.key_vault_reference_identity
}
