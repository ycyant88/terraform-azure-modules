module "avm-res-sql-server" {
  source                         = "Azure/avm-res-sql-server/azurerm"
  version                        = "0.1.2"
  diagnostic_settings            = var.diagnostic_settings
  license_type                   = var.license_type
  location                       = var.location
  lock                           = var.lock
  maintenance_configuration_name = var.maintenance_configuration_name
  max_size_bytes                 = var.max_size_bytes
  max_size_gb                    = var.max_size_gb
  name                           = var.name
  per_database_settings          = var.per_database_settings
  role_assignments               = var.role_assignments
  sku                            = var.sku
  sql_server                     = var.sql_server
  tags                           = var.tags
  zone_redundant                 = var.zone_redundant
}
