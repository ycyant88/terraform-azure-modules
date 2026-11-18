module "avm-res-dbforpostgresql-flexibleserver" {
  source           = "Azure/avm-res-dbforpostgresql-flexibleserver/azurerm"
  version          = "0.3.0"
  charset          = var.charset
  collation        = var.collation
  enable_telemetry = var.enable_telemetry
  location         = var.location
  name             = var.name
  server_id        = var.server_id
  timeouts         = var.timeouts
}
