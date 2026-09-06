module "avm-res-containerservice-managedcluster" {
  source                 = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version                = "0.7.3"
  adoption_policy        = var.adoption_policy
  annotations            = var.annotations
  default_network_policy = var.default_network_policy
  default_resource_quota = var.default_resource_quota
  delete_policy          = var.delete_policy
  labels                 = var.labels
  location               = var.location
  name                   = var.name
  parent_id              = var.parent_id
  tags                   = var.tags
}
