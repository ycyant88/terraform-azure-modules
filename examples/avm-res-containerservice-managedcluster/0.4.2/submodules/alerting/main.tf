module "avm-res-containerservice-managedcluster" {
  source         = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version        = "0.4.2"
  aks_cluster_id = var.aks_cluster_id
  alert_email    = var.alert_email
  parent_id      = var.parent_id
  tags           = var.tags
}
