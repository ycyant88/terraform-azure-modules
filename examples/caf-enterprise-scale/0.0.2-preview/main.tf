module "caf-enterprise-scale" {
  source                        = "Azure/caf-enterprise-scale/azurerm"
  version                       = "0.0.2-preview"
  es_archetype_config_overrides = var.es_archetype_config_overrides
  es_archetype_library_path     = var.es_archetype_library_path
  es_custom_landing_zones       = var.es_custom_landing_zones
  es_default_location           = var.es_default_location
  es_deploy_core_landing_zones  = var.es_deploy_core_landing_zones
  es_deploy_demo_landing_zones  = var.es_deploy_demo_landing_zones
  es_root_id                    = var.es_root_id
  es_root_name                  = var.es_root_name
  es_root_parent_id             = var.es_root_parent_id
  es_subscription_ids_overrides = var.es_subscription_ids_overrides
}
