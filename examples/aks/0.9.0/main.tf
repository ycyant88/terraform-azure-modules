module "aks" {
  source                      = "Azure/aks/azurerm"
  version                     = "0.9.0"
  CLIENT_ID                   = var.CLIENT_ID
  CLIENT_SECRET               = var.CLIENT_SECRET
  admin_username              = var.admin_username
  agents_count                = var.agents_count
  agents_size                 = var.agents_size
  location                    = var.location
  log_analytics_workspace_sku = var.log_analytics_workspace_sku
  log_retention_in_days       = var.log_retention_in_days
  prefix                      = var.prefix
  public_ssh_key              = var.public_ssh_key
}
