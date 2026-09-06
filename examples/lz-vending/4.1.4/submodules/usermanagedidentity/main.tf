module "lz-vending" {
  source                                = "Azure/lz-vending/azurerm"
  version                               = "4.1.4"
  federated_credentials_advanced        = var.federated_credentials_advanced
  federated_credentials_github          = var.federated_credentials_github
  federated_credentials_terraform_cloud = var.federated_credentials_terraform_cloud
  location                              = var.location
  name                                  = var.name
  resource_group_creation_enabled       = var.resource_group_creation_enabled
  resource_group_lock_enabled           = var.resource_group_lock_enabled
  resource_group_lock_name              = var.resource_group_lock_name
  resource_group_name                   = var.resource_group_name
  resource_group_tags                   = var.resource_group_tags
  subscription_id                       = var.subscription_id
  tags                                  = var.tags
}
