module "avm-res-devcenter-devcenter" {
  source                               = "Azure/avm-res-devcenter-devcenter/azurerm"
  version                              = "0.2.0"
  dev_center_gallery_dev_center_id     = var.dev_center_gallery_dev_center_id
  dev_center_gallery_name              = var.dev_center_gallery_name
  dev_center_gallery_shared_gallery_id = var.dev_center_gallery_shared_gallery_id
  dev_center_gallery_timeouts          = var.dev_center_gallery_timeouts
  enable_telemetry                     = var.enable_telemetry
  location                             = var.location
}
