module "aks" {
  source                         = "Azure/aks/azurerm"
  version                        = "4.0.0"
  admin_username                 = var.admin_username
  agents_count                   = var.agents_count
  agents_size                    = var.agents_size
  client_id                      = var.client_id
  client_secret                  = var.client_secret
  enable_log_analytics_workspace = var.enable_log_analytics_workspace
  log_analytics_workspace_sku    = var.log_analytics_workspace_sku
  log_retention_in_days          = var.log_retention_in_days
  prefix                         = var.prefix
  public_ssh_key                 = var.public_ssh_key
  resource_group_name            = var.resource_group_name
  tags                           = var.tags
}
