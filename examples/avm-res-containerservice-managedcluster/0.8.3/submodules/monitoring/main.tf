module "avm-res-containerservice-managedcluster" {
  source                     = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version                    = "0.8.3"
  aks_cluster_id             = var.aks_cluster_id
  ignore_body_changes        = var.ignore_body_changes
  location                   = var.location
  log_analytics_workspace_id = var.log_analytics_workspace_id
  parent_id                  = var.parent_id
  prometheus_workspace_id    = var.prometheus_workspace_id
  resource_types             = var.resource_types
  retry                      = var.retry
  tags                       = var.tags
  timeouts                   = var.timeouts
}
