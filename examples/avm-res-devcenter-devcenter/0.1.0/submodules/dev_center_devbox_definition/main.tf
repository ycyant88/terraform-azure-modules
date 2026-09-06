module "avm-res-devcenter-devcenter" {
  source                                           = "Azure/avm-res-devcenter-devcenter/azurerm"
  version                                          = "0.1.0"
  dev_center_dev_box_definition_dev_center_id      = var.dev_center_dev_box_definition_dev_center_id
  dev_center_dev_box_definition_image_reference_id = var.dev_center_dev_box_definition_image_reference_id
  dev_center_dev_box_definition_location           = var.dev_center_dev_box_definition_location
  dev_center_dev_box_definition_name               = var.dev_center_dev_box_definition_name
  dev_center_dev_box_definition_sku_name           = var.dev_center_dev_box_definition_sku_name
  dev_center_dev_box_definition_tags               = var.dev_center_dev_box_definition_tags
  dev_center_dev_box_definition_timeouts           = var.dev_center_dev_box_definition_timeouts
}
