module "avm-res-avs-privatecloud" {
  source                     = "Azure/avm-res-avs-privatecloud/azurerm"
  version                    = "0.7.4"
  bastion_name               = var.bastion_name
  bastion_pip_name           = var.bastion_pip_name
  bastion_subnet_resource_id = var.bastion_subnet_resource_id
  create_bastion             = var.create_bastion
  key_vault_resource_id      = var.key_vault_resource_id
  resource_group_location    = var.resource_group_location
  resource_group_name        = var.resource_group_name
  tags                       = var.tags
  vm_name                    = var.vm_name
  vm_sku                     = var.vm_sku
  vm_subnet_resource_id      = var.vm_subnet_resource_id
}
