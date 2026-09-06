module "avm-res-containerservice-managedcluster" {
  source                     = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version                    = "0.5.1"
  aks_cluster_id             = var.aks_cluster_id
  location                   = var.location
  log_analytics_workspace_id = var.log_analytics_workspace_id
  parent_id                  = var.parent_id
  prometheus_workspace_id    = var.prometheus_workspace_id
  tags                       = var.tags
}
