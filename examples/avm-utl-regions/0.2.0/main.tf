module "avm-utl-regions" {
  source                    = "Azure/avm-utl-regions/azurerm"
  version                   = "0.2.0"
  availability_zones_filter = var.availability_zones_filter
  enable_telemetry          = var.enable_telemetry
  geography_filter          = var.geography_filter
  geography_group_filter    = var.geography_group_filter
  recommended_filter        = var.recommended_filter
  use_cached_data           = var.use_cached_data
}
