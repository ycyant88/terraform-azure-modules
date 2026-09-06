module "avm-res-containerservice-managedcluster" {
  source                 = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version                = "0.4.2"
  adoption_policy        = var.adoption_policy
  annotations            = var.annotations
  default_network_policy = var.default_network_policy
  default_resource_quota = var.default_resource_quota
  delete_policy          = var.delete_policy
  labels                 = var.labels
  name                   = var.name
  parent_id              = var.parent_id
  tags                   = var.tags
}
