module "avm-utl-regions" {
  source                  = "Azure/avm-utl-regions/azurerm"
  version                 = "0.10.0"
  enable_telemetry        = var.enable_telemetry
  geography_filter        = var.geography_filter
  geography_filters       = var.geography_filters
  geography_group_filter  = var.geography_group_filter
  geography_group_filters = var.geography_group_filters
  has_availability_zones  = var.has_availability_zones
  has_pair                = var.has_pair
  is_recommended          = var.is_recommended
  region_filter           = var.region_filter
  region_name_regex       = var.region_name_regex
  use_cached_data         = var.use_cached_data
}
