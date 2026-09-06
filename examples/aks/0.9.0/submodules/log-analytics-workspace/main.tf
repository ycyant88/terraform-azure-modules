module "aks" {
  source                      = "Azure/aks/azurerm"
  version                     = "0.9.0"
  location                    = var.location
  log_analytics_workspace_sku = var.log_analytics_workspace_sku
  log_retention_in_days       = var.log_retention_in_days
  prefix                      = var.prefix
  resource_group_name         = var.resource_group_name
  retention_in_days           = var.retention_in_days
  sku                         = var.sku
}
