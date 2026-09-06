module "avm-res-dbforpostgresql-flexibleserver" {
  source    = "Azure/avm-res-dbforpostgresql-flexibleserver/azurerm"
  version   = "0.2.3"
  charset   = var.charset
  collation = var.collation
  name      = var.name
  server_id = var.server_id
  timeouts  = var.timeouts
}
