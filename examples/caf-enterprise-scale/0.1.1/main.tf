module "caf-enterprise-scale" {
  source                     = "Azure/caf-enterprise-scale/azurerm"
  version                    = "0.1.1"
  archetype_config_overrides = var.archetype_config_overrides
  create_duration_delay      = var.create_duration_delay
  custom_landing_zones       = var.custom_landing_zones
  default_location           = var.default_location
  deploy_core_landing_zones  = var.deploy_core_landing_zones
  deploy_demo_landing_zones  = var.deploy_demo_landing_zones
  destroy_duration_delay     = var.destroy_duration_delay
  library_path               = var.library_path
  root_id                    = var.root_id
  root_name                  = var.root_name
  root_parent_id             = var.root_parent_id
  subscription_id_overrides  = var.subscription_id_overrides
  template_file_variables    = var.template_file_variables
}
