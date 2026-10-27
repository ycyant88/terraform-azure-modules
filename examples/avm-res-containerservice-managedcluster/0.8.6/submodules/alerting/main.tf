module "avm-res-containerservice-managedcluster" {
  source              = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version             = "0.8.6"
  aks_cluster_id      = var.aks_cluster_id
  alert_email         = var.alert_email
  ignore_body_changes = var.ignore_body_changes
  location            = var.location
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  tags                = var.tags
  timeouts            = var.timeouts
}
