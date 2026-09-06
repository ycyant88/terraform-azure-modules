module "avm-res-devcenter-devcenter" {
  source                                    = "Azure/avm-res-devcenter-devcenter/azurerm"
  version                                   = "0.1.0"
  dev_center_environment_type_dev_center_id = var.dev_center_environment_type_dev_center_id
  dev_center_environment_type_name          = var.dev_center_environment_type_name
  dev_center_environment_type_tags          = var.dev_center_environment_type_tags
  dev_center_environment_type_timeouts      = var.dev_center_environment_type_timeouts
}
