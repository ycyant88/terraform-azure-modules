module "avm-res-web-site" {
  source          = "Azure/avm-res-web-site/azurerm"
  version         = "0.21.6"
  is_slot         = var.is_slot
  parent_id       = var.parent_id
  zip_deploy_file = var.zip_deploy_file
}
