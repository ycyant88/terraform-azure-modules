module "aks" {
  source                          = "Azure/aks/azurerm"
  version                         = "2.0.0"
  admin_public_ssh_key            = var.admin_public_ssh_key
  admin_username                  = var.admin_username
  agents_count                    = var.agents_count
  agents_size                     = var.agents_size
  kubernetes_version              = var.kubernetes_version
  location                        = var.location
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  prefix                          = var.prefix
  resource_group_name             = var.resource_group_name
  service_principal_client_id     = var.service_principal_client_id
  service_principal_client_secret = var.service_principal_client_secret
  tags                            = var.tags
}
