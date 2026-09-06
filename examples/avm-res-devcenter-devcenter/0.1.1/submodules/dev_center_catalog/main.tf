module "avm-res-devcenter-devcenter" {
  source                                 = "Azure/avm-res-devcenter-devcenter/azurerm"
  version                                = "0.1.1"
  dev_center_catalog_adogit              = var.dev_center_catalog_adogit
  dev_center_catalog_dev_center_id       = var.dev_center_catalog_dev_center_id
  dev_center_catalog_github              = var.dev_center_catalog_github
  dev_center_catalog_name                = var.dev_center_catalog_name
  dev_center_catalog_resource_group_name = var.dev_center_catalog_resource_group_name
}
