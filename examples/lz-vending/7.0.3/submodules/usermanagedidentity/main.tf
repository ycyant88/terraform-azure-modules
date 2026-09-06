module "lz-vending" {
  source                                = "Azure/lz-vending/azurerm"
  version                               = "7.0.3"
  federated_credentials_advanced        = var.federated_credentials_advanced
  federated_credentials_github          = var.federated_credentials_github
  federated_credentials_terraform_cloud = var.federated_credentials_terraform_cloud
  location                              = var.location
  name                                  = var.name
  parent_id                             = var.parent_id
  tags                                  = var.tags
}
